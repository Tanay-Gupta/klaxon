import 'package:flutter/material.dart';

import '../../../../infrastructure/models/hackathon_model.dart';
import '../../../../infrastructure/services/api/api_service.dart';
import '../../../values/platform_master.dart';
import '../../../values/values.dart';
import '../../homePage/components/listcontainer.dart';

class TabBarContent extends StatefulWidget {
  const TabBarContent({super.key});

  @override
  State<TabBarContent> createState() => _TabBarContentState();
}

class _TabBarContentState extends State<TabBarContent> {
  late Future<List<HackathonModel>> _hackathonsFuture;

  @override
  void initState() {
    super.initState();
    _hackathonsFuture = ContestHuntApi().fetchHackathons();
  }

  Future<void> _refresh() async {
    setState(() {
      _hackathonsFuture = ContestHuntApi().fetchHackathons();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const BouncingScrollPhysics(),
      children: [
        _buildHackathonList(isUpcoming: false),
        _buildHackathonList(isUpcoming: true),
      ],
    );
  }

  Widget _buildHackathonList({required bool isUpcoming}) {
    return FutureBuilder<List<HackathonModel>>(
      future: _hackathonsFuture,
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
                    child: Text(apiErrorMessage),
                  ),
                ),
              ],
            ),
          );
        }

        final filtered = snapshot.data!
            .where((hackathon) => (isUpcoming
                ? hackathon.startTime! * 1000 > DateTime.now().millisecondsSinceEpoch
                : hackathon.startTime! * 1000 <= DateTime.now().millisecondsSinceEpoch))
            .toList();

        return RefreshIndicator(
          onRefresh: _refresh,
          child: filtered.isEmpty
              ? ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: const [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Text(noHackathonsFound),
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final hackathon = filtered[index];
                    return ListContainer(
                      startTime: DateTime.fromMillisecondsSinceEpoch(
                              hackathon.startTime! * 1000)
                          .toIso8601String(),
                      endTime: DateTime.fromMillisecondsSinceEpoch(
                              hackathon.endTime! * 1000)
                          .toIso8601String(),
                      imgUrl:
                         platformLogos[hackathon.platform] ?? '$hackathon.platform',
                      contestUrl: hackathon.url ?? '',
                      title: hackathon.name ?? 'Untitled Hackathon',
                      isUpcoming: isUpcoming,
                      onContainerTap: () {
                        print('Tapped on hackathon: ${hackathon.name}');
                      },
                      onShareTap: () {
                        print('Share tapped for hackathon: ${hackathon.name}');
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
