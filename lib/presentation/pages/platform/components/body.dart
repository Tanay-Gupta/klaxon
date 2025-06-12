import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../infrastructure/models/platform_model.dart';
import '../../../values/constants.dart';
import 'contest_tab_bar.dart';
import 'tab_bar_content.dart';

class PlatformDetailBody extends StatelessWidget {
  final String platformName;
  final PlatformType platformType;
  const PlatformDetailBody({
    super.key,
    required this.platformName,
    required this.platformType,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double bannerHeight = screenHeight * 0.25;
    final width = MediaQuery.of(context).size.width;
    final String currentDateTime = DateFormat(
      'EEEE, MMM d • hh:mm a',
    ).format(DateTime.now());

    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0,
                  ),
                  child: Center(
                    child: Text(currentDateTime, style: kSubheadingtextStyle),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: Container(
                    height: bannerHeight,

                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: kSegmentedTabSelectedColor,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: Colors.white.withAlpha(13), // ~5% opacity

                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(64), // 255 * 0.25 ≈ 64

                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/testImages/banner.png', // Use dynamic index
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        height: bannerHeight - 20,
                      ),
                    ),
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
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 15),
          child: TabBarContent(
            platformName: platformName,
            platformType: platformType,
          ),
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
