import 'package:flutter/material.dart';
import '../../../../infrastructure/models/bounty_model.dart';
import '../../../../infrastructure/services/api/remote_config.dart';
import '../../../values/constants.dart';
import '../../../widgets/bounty_card.dart';
import '../../../widgets/trending_bounty.dart';
import '../../../widgets/trending_hackathon.dart';
import '../../homePage/components/contest_tab_bar.dart';
import 'tab_bar_content.dart';
import 'trendingAlert.dart';

class HomeBody extends StatefulWidget {
  final Function(int)? onNavigateToTab;

  const HomeBody({super.key, this.onNavigateToTab});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    final apiUrl = RemoteConfigService().baseAPI;

    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 20),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🚀 Top Carousel
          trendingAlertCarouselSlider(context),
          const SizedBox(height: 16),

          // 🏁 Coding Contests Section
          _buildSectionHeader(
            "Coding Contests",
            onTap: () => widget.onNavigateToTab?.call(1),
          ), // Go to Contests tab),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  ContestTabBar(width: width),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 240, // You can tune this height as needed
                    child: const TabBarContent(),
                  ),
                ],
              ),
            ),
          ),

          //const SizedBox(height: 24),

          // 🎯 Hackathons Section
          _buildSectionHeader(
            "Hackathons",
            onTap: () => widget.onNavigateToTab?.call(2),
          ), // Go to Hackathons tab
          TrendingHackathonCarousel(),

          const SizedBox(height: 24),

          // 🛡️ Bug Bounty Section
          _buildSectionHeader(
            "Bug Bounty",
            onTap: () => widget.onNavigateToTab?.call(3),
          ), // Go to Bounty tab
          TrendingBountyCarousel(),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(title, style: kSubheadingtextStyle),
          const Spacer(),
          TextButton(
            onPressed: onTap,
            child: Text("See All", style: kSubheading2textStyle),
          ),
        ],
      ),
    );
  }
}
