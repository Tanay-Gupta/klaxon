import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart'; // Required for context.go()

import '../../../values/constants.dart';

class PlatformGrid extends StatelessWidget {
  const PlatformGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final platforms = [
      {'name': 'Devfolio', 'icon': "assets/icons/coding_platforms/leetcode.svg"},
      {'name': 'Replit', 'icon': "assets/icons/coding_platforms/codechef.svg"},
      {'name': 'HackerEarth', 'icon': "assets/icons/coding_platforms/hackerearth.svg"},
      {'name': 'Request', 'icon': "assets/icons/coding_platforms/codeforces.svg"},
   ];

    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(11),
      child: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        physics: const NeverScrollableScrollPhysics(),
        children: platforms.map((platform) {
          return _PlatformIcon(
            name: platform['name']!,
            icon: platform['icon']!,
          );
        }).toList(),
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
    return Material(
      color: kPlatformGridBGColor,
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        decoration: BoxDecoration(
          color: kPlatformGridBGColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            context.push('/platform/$name');
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon, height: 30, width: 30),
              const SizedBox(height: 6),
              Text(
                name,
                style: gridIconTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
