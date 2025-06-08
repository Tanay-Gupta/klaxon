// import 'package:flutter/material.dart';
// import '../../../values/constants.dart';
// import '../../homePage/components/contest_tab_bar.dart';
// import 'tab_bar_content.dart';
// import 'trendingAlert.dart';

// class HomeBody extends StatefulWidget {
//   const HomeBody({super.key});

//   @override
//   State<HomeBody> createState() => _HomeBodyState();
// }

// class _HomeBodyState extends State<HomeBody> {
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     return SingleChildScrollView(
//       padding: const EdgeInsets.only(bottom: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           //---- Carousel Slider
//           trendingAlertCarouselSlider(context),

//           const SizedBox(height: 10),

//           // ----coding contest heading
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               children: [
//                 Text("Coding Contests", style: kSubheadingtextStyle),
//                 const Spacer(),
//                 TextButton(
//                   onPressed: () {
//                     // Handle "See All" action
//                   },
//                   child: Text("See All", style: kSubheading2textStyle),
//                 ),
//               ],
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: SizedBox(
//               height: 300,

//               // color: Colors.grey[800],
//               child: DefaultTabController(
//                 length: 2,
//                 child: Column(
//                   children: [
//                     ContestTabBar(width: width),
//                     const SizedBox(height: 20),
//                     Expanded(child: TabBarContent()),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           //--- List of Hackathons
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               children: [
//                 Text("Hackathons", style: kSubheadingtextStyle),
//                 const Spacer(),
//                 TextButton(
//                   onPressed: () {
//                     // Handle "See All" action
//                   },
//                   child: Text("See All", style: kSubheading2textStyle),
//                 ),
//               ],
//             ),
//           ),
//           trendingAlertCarouselSlider(context),
//           const SizedBox(height: 10),
//           //--- List of Bug Bounty
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               children: [
//                 Text("Bug Bounty", style: kSubheadingtextStyle),
//                 const Spacer(),
//                 TextButton(
//                   onPressed: () {
//                     // Handle "See All" action
//                   },
//                   child: Text("See All", style: kSubheading2textStyle),
//                 ),
//               ],
//             ),
//           ),
//           trendingAlertCarouselSlider(context),
//           // Add more content widgets below...
//           const SizedBox(height: 600), // Just for test scrolling
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../../values/constants.dart';
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
          _buildSectionHeader("Coding Contests", onTap:  () => widget.onNavigateToTab?.call(1)), // Go to Contests tab),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  ContestTabBar(width: width),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 250, // You can tune this height as needed
                    child: const TabBarContent(),
                  ),
                ],
              ),
            ),
          ),

          //const SizedBox(height: 24),

          // 🎯 Hackathons Section
          _buildSectionHeader("Hackathons", onTap: () => widget.onNavigateToTab?.call(2)),// Go to Hackathons tab
          trendingAlertCarouselSlider(context),

          const SizedBox(height: 24),

          // 🛡️ Bug Bounty Section
          _buildSectionHeader("Bug Bounty", onTap:() => widget.onNavigateToTab?.call(3)),// Go to Bounty tab
          trendingAlertCarouselSlider(context),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
