import 'package:flutter/material.dart';
import '../../../../infrastructure/models/bounty_model.dart';
import '../../../../infrastructure/models/contest_model.dart';
import '../../../../infrastructure/models/hackathon_model.dart';
import '../../../../infrastructure/models/platform_model.dart';
import '../../../../infrastructure/services/api/api_service.dart';
import '../../../values/constants.dart';
import '../../../values/platform_master.dart';
import '../../../values/values.dart';
import '../../../widgets/bounty_list_container.dart';
import '../../../widgets/contest_list_container.dart';
import '../../../widgets/hackathon_list_container.dart';
import '../../homePage/components/listcontainer.dart';
// Make sure your dummyData is in this path

class TabBarContent extends StatefulWidget {
  final String platformName;
  final PlatformType platformType;
  const TabBarContent({
    super.key,
    required this.platformName,
    required this.platformType,
  });

  @override
  State<TabBarContent> createState() => _TabBarContentState();
}

class _TabBarContentState extends State<TabBarContent> {
  late Future<List<dynamic>> _futureData;
  bool _isRefreshing = false;
  final ContestHuntApi _contestHuntApi = ContestHuntApi();

  @override
  void initState() {
    super.initState();
    // _futureContests = _contestHuntApi.fetchContests(platform: widget.platformName);
    _futureData = getPlatformDataFuture();
  }

  Future<List<dynamic>> getPlatformDataFuture() {
    switch (widget.platformType) {
      case PlatformType.contest:
        return _contestHuntApi.fetchContests(platform: widget.platformName);
      case PlatformType.hackathon:
        return _contestHuntApi.fetchHackathons(platform: widget.platformName);
      case PlatformType.bounty:
        return _contestHuntApi.fetchBounties(platform: widget.platformName);
    }
  }

  Future<void> _refreshData() async {
    setState(() {
      _isRefreshing = true;
      _futureData = getPlatformDataFuture();
    });
    await _futureData;
    setState(() {
      _isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _futureData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            !_isRefreshing) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return RefreshIndicator(
            onRefresh: _refreshData,
            child: ListView(
              children: const [
                SizedBox(
                  height: 300,
                  child: Center(child: Text(noContestsFound, style: kH1textStyle)),
                ),
              ],
            ),
          );
        } else {
          final contests = snapshot.data!;
          final upcoming =
              contests
                  .where(
                    (e) =>
                        e.startTime != null &&
                        (DateTime.fromMillisecondsSinceEpoch(
                          e.startTime! * 1000,
                        ).isAfter(DateTime.now())),
                  )
                  .toList();
          final ongoing = contests.where((e) => !upcoming.contains(e)).toList();

          return TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              _buildContestList(upcoming, widget.platformType),
              _buildContestList(ongoing, widget.platformType),
            ],
          );
        }
      },
    );
  }

  Widget _buildContestList(List<dynamic> contests, PlatformType platformType) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: contests.isEmpty
                  ? ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: const [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 100),
                          child: Text(noDataFound, style: kH1textStyle),
                        ),
                      ),
                    ],
                  )
                  : ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: contests.length,
        itemBuilder: (context, index) {
          final contest = contests[index];
          if (platformType == PlatformType.contest) {
            ContestModel temp = contest;
            return ContestListContainer(
              contestModel: temp,
              imgPath: platformLogos[contest.platform] ?? '',
              isUpcoming: DateTime.fromMillisecondsSinceEpoch(
                contest.startTime! * 1000,
              ).isAfter(DateTime.now()),
            );
          } else if (platformType == PlatformType.hackathon) {
            HackathonModel temp = contest;
            return HackathonListContainer(
              hackathonModel: temp,
              imgPath: platformLogos[contest.platform] ?? '',
              isUpcoming: DateTime.fromMillisecondsSinceEpoch(
                contest.startTime! * 1000,
              ).isAfter(DateTime.now()),
            );
          }
          // If it's a bounty, return a bounty list container
          BountyModel bountyModel = contest;
          return BountyListContainer(
            bountyModel: bountyModel,
            imgPath:
                platformLogos[contest.platform] ??
                '', // Backup URL if not found

            isUpcoming: DateTime.fromMillisecondsSinceEpoch(
              contest.startTime! * 1000,
            ).isAfter(DateTime.now()),
          );
        },
      ),
    );
  }
}
