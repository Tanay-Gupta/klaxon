import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../values/constants.dart';

class PlatformGrid extends StatelessWidget {
  const PlatformGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        //color: const Color(0xff110919),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(11),
      child: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          _PlatformIcon(name: 'LeetCode', icon: "assets/icons/coding_platforms/leetcode.svg"),
          _PlatformIcon(name: 'CodeChef', icon: "assets/icons/coding_platforms/codechef.svg"),
          _PlatformIcon(name: 'HackerRank', icon: "assets/icons/coding_platforms/hackerrank.svg"),
          _PlatformIcon(name: 'Codeforces', icon: "assets/icons/coding_platforms/codeforces.svg"),
          _PlatformIcon(name: 'AtCoder', icon: "assets/icons/coding_platforms/atcoder.svg"),
          _PlatformIcon(name: 'TopCoder', icon: "assets/icons/coding_platforms/topcoder.svg"),
          _PlatformIcon(name: 'NowCoder', icon: "assets/icons/coding_platforms/leetcode.svg"),
          _PlatformIcon(name: 'GFG', icon: "assets/icons/coding_platforms/geeksforgeeks.svg"),
          _PlatformIcon(name: 'HackerEarth', icon: "assets/icons/coding_platforms/hackerearth.svg"),
          _PlatformIcon(name: 'Code360', icon: "assets/icons/coding_platforms/leetcode.svg"),
          _PlatformIcon(name: 'CS Academy', icon: "assets/icons/coding_platforms/csAcademy.svg"),
          _PlatformIcon(name: 'Request', icon: "assets/icons/coding_platforms/leetcode.svg"),
        ],
      ),
    );
  }
}

class _PlatformIcon extends StatelessWidget {
  final String name;
  final String icon;

  const _PlatformIcon({required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPlatformGridBGColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SvgPicture.asset(icon, height: 30, width: 30),
          const SizedBox(height: 6),
          Text(name, style: gridIconTextStyle, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
