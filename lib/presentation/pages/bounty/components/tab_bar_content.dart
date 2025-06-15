

import 'package:flutter/material.dart';
import '../../../../infrastructure/models/bounty_model.dart';
import '../../../../infrastructure/services/api/api_service.dart';
import '../../../values/constants.dart';
import '../../../values/platform_master.dart';
import '../../../values/values.dart';
import '../../../widgets/bounty_list_container.dart';
import '../../homePage/components/listcontainer.dart';

class TabBarContent extends StatefulWidget {
  const TabBarContent({super.key});

  @override
  State<TabBarContent> createState() => _TabBarContentState();
}

class _TabBarContentState extends State<TabBarContent> {
  late Future<List<BountyModel>> _bountiesFuture;

  @override
  void initState() {
    super.initState();
    _bountiesFuture = ContestHuntApi().fetchBounties(); // fetch all
  }

  Future<void> _refresh() async {
    setState(() {
      _bountiesFuture = ContestHuntApi().fetchBounties();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const BouncingScrollPhysics(),
      children: [
        _buildBountyList(isPaid: true),
        _buildBountyList(isPaid: false),
      ],
    );
  }

  Widget _buildBountyList({required bool isPaid}) {
    return FutureBuilder<List<BountyModel>>(
      future: _bountiesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text(apiErrorMessage,style: kH1textStyle),
                  ),
                ),
              ],
            ),
          );
        }

        final filtered =
            snapshot.data!
                .where(
                  (bounty) =>
                      (isPaid ? bounty.amount! > 0 : bounty.amount == 0),
                )
                .toList();

        return RefreshIndicator(
          onRefresh: _refresh,
          child:
              filtered.isEmpty
                  ? ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: const [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 100),
                          child: Text(noBountiesFound, style: kH1textStyle),
                        ),
                      ),
                    ],
                  )
                  : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final bounty = filtered[index];
                      return BountyListContainer(
                        bountyModel: bounty,
                        imgPath:
                            platformLogos[bounty.platform] ??
                            '$bounty.platform',

                        isUpcoming: true,
                      );
                    },
                  ),
        );
      },
    );
  }
}
