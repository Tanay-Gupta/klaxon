import 'package:flutter/material.dart';
import '../../../values/dummy_data.dart';
import '../../homePage/components/listcontainer.dart';
// Make sure your dummyData is in this path

class TabBarContent extends StatelessWidget {
  const TabBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const BouncingScrollPhysics(),
      children: [
        _buildContestList(isUpcoming: false),
        _buildContestList(isUpcoming: true),
      ],
    );
  }

  Widget _buildContestList({required bool isUpcoming}) {
    final contests =
        dummyData.where((contest) => contest.isUpcoming == isUpcoming).toList();

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: contests.length,
      itemBuilder: (context, index) {
        final contest = contests[index];
        return ListContainer(
        //  durationInHr: contest.durationInHr.toString(),
          startTime: contest.startTime.toIso8601String(),
          endTime: contest.endTime.toString(),
          imgUrl: contest.imgUrl,
          contestUrl: contest.contestUrl,
          title: contest.title,
        //  isDone: contest.isDone,
        isUpcoming: contest.isUpcoming,
          onContainerTap: () {
            print('Tapped on contest: ${contest.title}');
          },
          onShareTap: () {
            // Implement share functionality here
            print('Share tapped for contest: ${contest.title}');
          },
        );
      },
    );
  }
}
