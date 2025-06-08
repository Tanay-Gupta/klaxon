import 'package:flutter/material.dart';
import '../../../values/constants.dart';
import 'contest_tab_bar.dart';
import 'platform_grid.dart';
import 'tab_bar_content.dart';

class ContestBody extends StatelessWidget {
  const ContestBody({super.key});

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
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                  child: Center(
                    child: Text(
                      "Competitive Programming Platforms",
                      style: kSubheadingtextStyle,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: PlatformGrid(),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: ContestSliverTabBarDelegate(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ContestTabBar(width: width),
                  ),
                ),
              ),
            ],
        body: const Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 15),
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
