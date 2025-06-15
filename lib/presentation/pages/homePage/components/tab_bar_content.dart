import 'package:flutter/material.dart';

import '../../../../infrastructure/models/contest_model.dart';
import '../../../../infrastructure/services/api/api_service.dart';
import '../../../values/platform_master.dart';
import '../../../values/values.dart';
import '../../../widgets/contest_list_container.dart';

class TabBarContent extends StatefulWidget {
  const TabBarContent({super.key});

  @override
  State<TabBarContent> createState() => _TabBarContentState();
}

class _TabBarContentState extends State<TabBarContent> {
  late Future<List<ContestModel>> _futureContests;
  bool _isRefreshing = false;
  final ContestHuntApi _contestHuntApi = ContestHuntApi();

  @override
  void initState() {
    super.initState();
    _futureContests = _contestHuntApi.fetchContests();
  }

  Future<void> _refreshData() async {
    setState(() {
      _isRefreshing = true;
      _futureContests = _contestHuntApi.fetchContests();
    });
    await _futureContests;
    setState(() {
      _isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ContestModel>>(
      future: _futureContests,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting && !_isRefreshing) {
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
                  child: Center(child: Text(noContestsFound)),
                ),
              ],
            ),
          );
        } else {
          final contests = snapshot.data!;
          final upcoming = contests
              .where(
                (e) =>
                    e.startTime != null &&
                    DateTime.fromMillisecondsSinceEpoch(e.startTime! * 1000)
                        .isAfter(DateTime.now()),
              )
              .take(3)
              .toList();

          final ongoing = contests
              .where((e) => !upcoming.contains(e))
              .take(3)
              .toList();

          return TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              _buildContestList(ongoing),
              _buildContestList(upcoming),
            ],
          );
        }
      },
    );
  }

  Widget _buildContestList(List<ContestModel> contests) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: contests.length,
        itemBuilder: (context, index) {
          final contest = contests[index];
          return ContestListContainer(
            maxLines: 1,
            contestModel: contest,
            imgPath: platformLogos[contest.platform] ?? '',
            isUpcoming: DateTime.fromMillisecondsSinceEpoch(
              contest.startTime! * 1000,
            ).isAfter(DateTime.now()),
          );
        },
      ),
    );
  }
}
