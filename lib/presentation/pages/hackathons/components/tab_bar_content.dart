import 'package:flutter/material.dart';

import '../../../../infrastructure/models/hackathon_model.dart';
import '../../../../infrastructure/services/api/api_service.dart';
import '../../../values/platform_master.dart';
import '../../../values/values.dart';
import '../../../widgets/hackathon_list_container.dart';

class TabBarContent extends StatefulWidget {
  const TabBarContent({super.key});

  @override
  State<TabBarContent> createState() => _TabBarContentState();
}

class _TabBarContentState extends State<TabBarContent> {
  static Future<List<HackathonModel>>? _cachedHackathonsFuture;
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _cachedHackathonsFuture ??= ContestHuntApi().fetchHackathons();
  }

  Future<void> _refresh() async {
    setState(() {
      _isRefreshing = true;
      _cachedHackathonsFuture = ContestHuntApi().fetchHackathons();
    });
    await _cachedHackathonsFuture;
    setState(() {
      _isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const BouncingScrollPhysics(),
      children: [
        _buildHackathonList(isUpcoming: true),
        _buildHackathonList(isUpcoming: false),
      ],
    );
  }

  Widget _buildHackathonList({required bool isUpcoming}) {
    return FutureBuilder<List<HackathonModel>>(
      future: _cachedHackathonsFuture,
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
                  child: Center(child: Text(apiErrorMessage)),
                ),
              ],
            ),
          );
        }

        final filtered = snapshot.data!.where((hackathon) {
          final start = hackathon.startTime;
          if (start == null) return false;
          final now = DateTime.now().millisecondsSinceEpoch;
          return isUpcoming ? start * 1000 > now : start * 1000 <= now;
        }).toList();

        return RefreshIndicator(
          onRefresh: _refresh,
          child: filtered.isEmpty
              ? ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Center(child: Text(noHackathonsFound)),
                    ),
                  ],
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final hackathon = filtered[index];
                    return HackathonListContainer(
                      hackathonModel: hackathon,
                      imgPath: platformLogos[hackathon.platform] ?? '${hackathon.platform}',
                      isUpcoming: isUpcoming,
                    );
                  },
                ),
        );
      },
    );
  }
}
