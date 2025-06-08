import 'package:flutter/material.dart';

import '../../../values/constants.dart';

class PlatformGrid extends StatelessWidget {
  const PlatformGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        // color: const Color(0xff110919),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(15),
      child: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          _PlatformIcon(name: 'LeetCode', icon: Icons.code),
          _PlatformIcon(name: 'CodeChef', icon: Icons.emoji_food_beverage),
          _PlatformIcon(name: 'HackerRank', icon: Icons.terminal),
          _PlatformIcon(name: 'Codeforces', icon: Icons.bolt),
          _PlatformIcon(name: 'AtCoder', icon: Icons.cloud),
          _PlatformIcon(name: 'TopCoder', icon: Icons.star),
          _PlatformIcon(name: 'Kickstart', icon: Icons.flash_on),
          _PlatformIcon(name: 'Turing', icon: Icons.memory),
          _PlatformIcon(name: 'DevPost', icon: Icons.lightbulb),
          _PlatformIcon(name: 'Unstop', icon: Icons.emoji_events),
          _PlatformIcon(name: 'Kaggle', icon: Icons.bar_chart),
          _PlatformIcon(name: 'Codility', icon: Icons.bug_report),
          _PlatformIcon(name: 'CS Academy', icon: Icons.school),
          _PlatformIcon(name: 'InterviewBit', icon: Icons.question_answer),
          _PlatformIcon(name: 'BinarySearch', icon: Icons.search),
          _PlatformIcon(name: 'AlgoExpert', icon: Icons.explore),
        ],
      ),
    );
  }
}

class _PlatformIcon extends StatelessWidget {
  final String name;
  final IconData icon;

  const _PlatformIcon({required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff110919),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
