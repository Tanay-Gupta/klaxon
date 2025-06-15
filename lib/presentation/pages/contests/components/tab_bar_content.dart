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
  static Future<List<ContestModel>>? _cachedFutureContests;
  bool _isRefreshing = false;
  final ContestHuntApi _contestHuntApi = ContestHuntApi();

  @override
  void initState() {
    super.initState();
    _cachedFutureContests ??= _contestHuntApi.fetchContests();
  }

  Future<void> _refreshData() async {
    setState(() {
      _isRefreshing = true;
      _cachedFutureContests = _contestHuntApi.fetchContests();
    });
    await _cachedFutureContests;
    setState(() {
      _isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ContestModel>>(
      future: _cachedFutureContests,
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
          final upcoming = contests.where((e) {
            final start = e.startTime;
            if (start == null) return false;
            return DateTime.fromMillisecondsSinceEpoch(start * 1000).isAfter(DateTime.now());
          }).toList();

          final ongoing = contests.where((e) => !upcoming.contains(e)).toList();

          return TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [_buildContestList(upcoming), _buildContestList(ongoing)],
          );
        }
      },
    );
  }

  Widget _buildContestList(List<ContestModel> contests) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: contests.length,
        itemBuilder: (context, index) {
          final contest = contests[index];
          final isUpcoming = DateTime.fromMillisecondsSinceEpoch(
            contest.startTime! * 1000,
          ).isAfter(DateTime.now());

          return ContestListContainer(
            contestModel: contest,
            imgPath: platformLogos[contest.platform] ?? '',
            isUpcoming: isUpcoming,
          );
        },
      ),
    );
  }
}
