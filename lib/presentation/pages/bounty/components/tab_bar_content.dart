// import 'package:flutter/material.dart';
// import '../../../values/dummy_data.dart';
// import '../../homePage/components/listcontainer.dart';
// // Make sure your dummyData is in this path

// class TabBarContent extends StatelessWidget {
//   const TabBarContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TabBarView(
//       physics: const BouncingScrollPhysics(),
//       children: [
//         _buildContestList(isUpcoming: false),
//         _buildContestList(isUpcoming: true),
//       ],
//     );
//   }

//   Widget _buildContestList({required bool isUpcoming}) {
//     final contests =
//         dummyData.where((contest) => contest.isUpcoming == isUpcoming).toList();

//     return ListView.builder(
//       physics: const BouncingScrollPhysics(),
//       itemCount: contests.length,
//       itemBuilder: (context, index) {
//         final contest = contests[index];
//         return ListContainer(
//         //  durationInHr: contest.durationInHr.toString(),
//           startTime: contest.startTime.toIso8601String(),
//           endTime: contest.endTime.toString(),
//           imgUrl: contest.imgUrl,
//           contestUrl: contest.contestUrl,
//           title: contest.title,
//         //  isDone: contest.isDone,
//         isUpcoming: contest.isUpcoming,
//           onContainerTap: () {
//             print('Tapped on contest: ${contest.title}');
//           },
//           onShareTap: () {
//             // Implement share functionality here
//             print('Share tapped for contest: ${contest.title}');
//           },
//         );
//       },
//     );
//   }
// }
// lib/screens/bounty/components/tab_bar_content.dart

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
