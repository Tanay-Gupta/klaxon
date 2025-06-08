import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../values/constants.dart';

class PlatformGrid extends StatelessWidget {
  const PlatformGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
          _PlatformIcon(name: 'Devfolio', icon: "assets/icons/coding_platforms/leetcode.svg"),
          _PlatformIcon(name: 'Replit', icon: "assets/icons/coding_platforms/codechef.svg"),
          _PlatformIcon(name: 'HackerEarth', icon: "assets/icons/coding_platforms/hackerearth.svg"),
          _PlatformIcon(name: 'Request', icon: "assets/icons/coding_platforms/codeforces.svg"),

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
