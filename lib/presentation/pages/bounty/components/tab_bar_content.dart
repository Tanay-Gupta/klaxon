import 'package:flutter/material.dart';

import '../../../../infrastructure/models/bounty_model.dart';
import '../../../../infrastructure/services/api/api_service.dart';
import '../../../values/constants.dart';
import '../../../values/platform_master.dart';
import '../../../values/values.dart';
import '../../../widgets/bounty_list_container.dart';

class TabBarContent extends StatefulWidget {
  const TabBarContent({super.key});

  @override
  State<TabBarContent> createState() => _TabBarContentState();
}

class _TabBarContentState extends State<TabBarContent> {
  static Future<List<BountyModel>>? _cachedBountiesFuture;
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _cachedBountiesFuture ??= ContestHuntApi().fetchBounties();
  }

  Future<void> _refresh() async {
    setState(() {
      _isRefreshing = true;
      _cachedBountiesFuture = ContestHuntApi().fetchBounties();
    });
    await _cachedBountiesFuture;
    setState(() {
      _isRefreshing = false;
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
      future: _cachedBountiesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting && !_isRefreshing) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Center(child: Text(apiErrorMessage, style: kH1textStyle)),
                ),
              ],
            ),
          );
        }

        final filtered = snapshot.data!.where((bounty) {
          final amount = bounty.amount ?? 0;
          return isPaid ? amount > 0 : amount == 0;
        }).toList();

        return RefreshIndicator(
          onRefresh: _refresh,
          child: filtered.isEmpty
              ? ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Center(child: Text(noBountiesFound, style: kH1textStyle)),
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
                      imgPath: platformLogos[bounty.platform] ?? '${bounty.platform}',
                      isUpcoming: true, // If needed, this can be computed too
                    );
                  },
                ),
        );
      },
    );
  }
}
