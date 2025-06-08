import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:lottie/lottie.dart';

import '../../values/constants.dart';
import '../notificationPage/notification_screen.dart';
import 'components/listcontainer.dart';
import 'components/trendingAlert.dart';

// Custom delegate for sticky tab bar
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  const _SliverTabBarDelegate({required this.child});

  @override
  double get minExtent => 46.0;

  @override
  double get maxExtent => 46.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: kBackgroundColor,
        title: const Text(' AlgoHunt', style: kTitleTextStyle),
        centerTitle: false,
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/home_screen/bell.svg"),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EmptyNotificationsScreen(),
                  ),
                ),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder:
              (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(child: trendingAlertCarouselSlider(context)),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: const Text(
                      "Let's explore contests happening around",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverTabBarDelegate(
                    child: Container(
                      color: kBackgroundColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 2.5,
                      ),
                      child: ButtonsTabBar(
                        backgroundColor: kBlueColor,
                        unselectedBackgroundColor: Colors.white,
                        labelStyle: kSubtitleTextSyle.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        unselectedLabelStyle: kSubtitleTextSyle.copyWith(
                          color: kTextColor,
                          fontSize: 14,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        radius: 20,
                        tabs: [
                          Tab(
                            text: 'Live',
                            icon: Lottie.asset(livePulseAnimation, height: 15),
                          ),
                          const Tab(text: 'Upcoming'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
          body: const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 15),
            child: TabBarContent(),
          ),
        ),
      ),
    );
  }
}

class TabBarContent extends StatelessWidget {
  const TabBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const BouncingScrollPhysics(),
      children: [
        // Live Contests
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            final contest = dummyData[index];
            return ListContainer(
             // durationInHr: contest.durationInHr,
              startTime: contest.startTime,
              endTime: contest.endTime,
              imgUrl: contest.imgUrl,
              contestUrl: contest.contestUrl,
              title: contest.title,
              //isDone: contest.isDone,
            );
          },
        ),
        // Upcoming Contests
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            final contest = dummyData[index];
            return ListContainer(
             // durationInHr: contest.durationInHr,
              startTime: contest.startTime,
              endTime: contest.endTime,
              imgUrl: contest.imgUrl,
              contestUrl: contest.contestUrl,
              title: contest.title,
            //  isDone: contest.isDone,
            );
          },
        ),
      ],
    );
  }
}
