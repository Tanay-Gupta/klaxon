import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:klaxon/presentation/values/values.dart';
import 'package:lottie/lottie.dart';

import '../../../values/constants.dart';

class ContestTabBar extends StatelessWidget {
  final double width;
  const ContestTabBar({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSegmentedTabBGColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ButtonsTabBar(
        width: width / 2 - 20,
        contentCenter: true,
        backgroundColor: kSegmentedTabSelectedColor,
        unselectedBackgroundColor: kSegmentedTabBGColor,
        labelStyle: kSubtitleTextSyle.copyWith(
          color: Colors.white,
          fontSize: 14,
        ),
        unselectedLabelStyle: kSubtitleTextSyle.copyWith(
          color: Colors.grey,
          fontSize: 14,
        ),
        radius: 12,
        tabs: [
          Tab(text: 'Live', icon: Lottie.asset(livePulseAnimation, height: 15)),
          const Tab(text: 'Upcoming'),
        ],
      ),
    );
  }
}
