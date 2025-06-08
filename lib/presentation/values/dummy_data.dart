import 'package:flutter/material.dart';

class Contest {
  final int number;
  final double durationInHr;
  final DateTime startTime;
  final DateTime endTime;
  final String imgUrl;
  final String contestUrl;
  final String title;
  final bool isDone;
  final bool isUpcoming;

  const Contest({
    required this.number,
    required this.durationInHr,
    required this.startTime,
    required this.endTime,
    required this.imgUrl,
    required this.contestUrl,
    required this.title,
    required this.isDone,
    required this.isUpcoming,
  });
}

// Dummy list of contests
final List<Contest> dummyData = [
  Contest(
    number: 1,
    durationInHr: 2,
    startTime: DateTime.now().subtract(const Duration(hours: 3)),
    endTime: DateTime.now().subtract(const Duration(hours: 1)),
    imgUrl: 'assets/icons/coding_platforms/leetcode.svg',
    contestUrl: 'https://leetcode.com/contest',
    title: 'LeetCode Weekly Contest',
    isDone: true,
    isUpcoming: false,
  ),
  Contest(
    number: 2,
    durationInHr: 3,
    startTime: DateTime.now().add(const Duration(hours: 2)),
    endTime: DateTime.now().add(const Duration(hours: 5)),
    imgUrl: 'assets/icons/coding_platforms/codeforces.svg',
    contestUrl: 'https://codeforces.com/contest',
    title: 'Codeforces Div 2',
    isDone: false,
    isUpcoming: true,
  ),
  Contest(
    number: 3,
    durationInHr: 1.5,
    startTime: DateTime.now().add(const Duration(days: 1)),
    endTime: DateTime.now().add(const Duration(days: 1, hours: 1, minutes: 30)),
    imgUrl: 'assets/icons/coding_platforms/hackerrank.svg',
    contestUrl: 'https://www.hackerrank.com/contests',
    title: 'HackerRank Monthly Challenge',
    isDone: false,
    isUpcoming: true,
  ), 
  Contest(
    number: 4,
    durationInHr: 4,
    startTime: DateTime.now().subtract(const Duration(days: 2)),
    endTime: DateTime.now().subtract(const Duration(days: 1)),
    imgUrl: 'assets/icons/coding_platforms/codechef.svg',
    contestUrl: 'https://www.codechef.com/contests',
    title: 'CodeChef Long Challenge',
    isDone: true,
    isUpcoming: false,
  ),   

  // Add more items as needed
];
