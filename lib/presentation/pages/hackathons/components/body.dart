import 'package:flutter/material.dart';
import '../../../values/constants.dart';
import '../../hackathons/components/contest_tab_bar.dart';
import '../../hackathons/components/platform_grid.dart';
import '../../hackathons/components/tab_bar_content.dart';


class HackathonBody extends StatelessWidget {
  const HackathonBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 5.0,
                  ),
                  child: Center(
                    child: Text(
                      "Get ready to code and win exciting prizes!",
                      style: kSubheadingtextStyle,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: PlatformGrid(),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: ContestSliverTabBarDelegate(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ContestTabBar(width: width),
                  ),
                ),
              ),
            ],
        body: const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          child: TabBarContent(),
        ),
      ),
    );
  }
}

class ContestSliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  const ContestSliverTabBarDelegate({required this.child});

  @override
  double get minExtent => 40.0;

  @override
  double get maxExtent => 41.0;

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
