import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../values/constants.dart';
import '../../bounty/components/contest_tab_bar.dart';
import '../../bounty/components/tab_bar_content.dart';

class BountyBody extends StatelessWidget {
  const BountyBody({super.key});

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
                      "Discover, and earn rewards with bounties!",
                      style: kSubheadingtextStyle,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: SvgPicture.asset(
                    'assets/icons/bounty_screen/bug-fixing.svg',
                    width: 200,
                    height: 200,
                  ),
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
