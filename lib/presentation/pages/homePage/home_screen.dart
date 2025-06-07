import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:lottie/lottie.dart';

import '../../values/constants.dart';
import '../notificationPage/notification_screen.dart';
import 'components/listcontainer.dart';
import 'components/trendingAlert.dart';

// SliverPersistentHeader Delegate
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverTabBarDelegate({required this.child});

  @override
  double get minExtent => 46.0; // Height of the tab bar
  @override
  double get maxExtent => 46.0; // Keep consistent for fixed height

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true; // Rebuild when needed
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,

      //-----------------------------------------------AppBar-----------------------------------------------
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: kBackgroundColor,
        title: const Text(' AlgoHunt', style: kTitleTextStyle),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/home_screen/bell.svg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmptyNotificationsScreen(),
                ),
              );
            },
          ),
        ],
      ),

      //-------------------------------------------------Body-------------------------------------------------
      body: DefaultTabController(
        length: 2, // Number of tabs
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              // Trending Alerts Carousel (Scrollable)
              SliverToBoxAdapter(child: trendingAlertCarouselSlider(context)),

              // Header Text (Scrollable)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Text(
                    "Let's explore contests happening around",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // Persistent Tab Bar Header (Pinned)
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverTabBarDelegate(
                  child: Container(
                    color: kBackgroundColor,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 2.5,
                        bottom: 2.5,
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
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        radius: 20,
                        tabs: [
                          Tab(
                            text: 'Live',
                            icon: Lottie.asset(livePulseAnimation, height: 15),
                          ),
                          Tab(text: 'Upcoming'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              // Tab for "Upcoming" Contests
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: dummyData.length,
                  itemBuilder: (context, index) {
                    final contest = dummyData[index];
                    return ListContainer(
                      number: contest.number,
                      durationInHr: contest.durationInHr,
                      startTime: contest.startTime,
                      endTime: contest.endTime,
                      imgUrl: contest.imgUrl,
                      contestUrl: contest.contestUrl,
                      title: contest.title,
                      isDone: contest.isDone,
                    );
                  },
                ),
              ),

              // Tab for "Live" Contests
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: dummyData.length,
                  itemBuilder: (context, index) {
                    final contest = dummyData[index];
                    return ListContainer(
                      number: contest.number,
                      durationInHr: contest.durationInHr,
                      startTime: contest.startTime,
                      endTime: contest.endTime,
                      imgUrl: contest.imgUrl,
                      contestUrl: contest.contestUrl,
                      title: contest.title,
                      isDone: contest.isDone,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
