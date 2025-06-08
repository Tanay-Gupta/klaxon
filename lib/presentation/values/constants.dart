import 'package:flutter/material.dart';

import '../pages/homePage/components/listcontainer.dart';

// Colors

//----Navigation Bar Colors
const kNavIconTextColor = Colors.white;
const kNavBackgroundColorDark = Color(0xFF030303);
const kNavUnselectedIconColor = Color(0xffA6A6A6);
//----AppBar Colors
const kTextColor = Colors.white;
const kAppbarTitleTextColor = Colors.white;

//----button Colors
const kButtonColor = Color(0xFF8C45FF);

//----segmented tab Colors
const kSegmentedTabBGColor = Color(0xff110919);
const kSegmentedTabSelectedColor = Color(0xff2C114A);

const kBlueColor = Color(0xFF6E8AFA);
const kBestSellerColor = Color(0xFFFFD073);
const kGreenColor = Color(0xFF49CC96);
const kBackgroundColor = Color(0xFF030303);
const kSecondaryBackgroundColor = Color(0xFFF5F4EF);



// My Text Styles
const kAppbarTitleStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  fontSize: 20,
  color: kAppbarTitleTextColor,
  fontFamily: "Rubik",
  fontWeight: FontWeight.bold,
);
const kHeadingextStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  fontSize: 18,
  color: kTextColor,
  fontFamily: "Rubik",
  fontWeight: FontWeight.bold,
);

const kSubheadingtextStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  fontSize: 16,
  color: kTextColor,
  fontWeight: FontWeight.w500,
  fontFamily: "Rubik",
);
const kSubheading2textStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  fontSize: 14,
  color: Color(0xffA6A6A6),
  fontWeight: FontWeight.w400,
  fontFamily: "Rubik",
);

const gridIconTextStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  fontSize: 12,
  color: kTextColor,
  fontFamily: "Rubik",
  fontWeight: FontWeight.w400,
);
const kTitleTextStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  fontSize: 30,
  color: kTextColor,
  fontFamily: "Rubik",
  fontWeight: FontWeight.w700,
);

const kSubtitleTextSyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  fontSize: 14,
  color: kTextColor,
  fontFamily: "Rubik",
  fontWeight: FontWeight.w700,
);

const kNavIconTextStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  fontSize: 12,
  color: kNavIconTextColor,
  fontFamily: "Rubik",
  fontWeight: FontWeight.w700,
);

// Path: lib/presentation/values/constants.dart

const livePulseAnimation = 'assets/animations/livePulse.json';

List<ListContainer> dummyData = [
  ListContainer(
    number: "1",
    title: "CodeChef Long Challenge",
    durationInHr: "10800", // 3 hours in seconds
    startTime: "2024-12-01T09:00:00Z",
    endTime: "2024-12-01T12:00:00Z",
    imgUrl: 'assets/icons/codechef.svg',
    contestUrl: 'www.codechef.com',
  ),
  ListContainer(
    number: "2",
    title: "CodeForces Round #891",
    durationInHr: "7200", // 2 hours in seconds
    startTime: "2024-12-02T14:00:00Z",
    endTime: "2024-12-02T16:00:00Z",
    imgUrl: 'assets/icons/codeforces.svg',
    contestUrl: 'www.codeforces.com',
  ),
  ListContainer(
    number: "3",
    title: "HackerEarth Coding Challenge",
    durationInHr: "14400", // 4 hours in seconds
    startTime: "2024-12-03T18:00:00Z",
    endTime: "2024-12-03T22:00:00Z",
    imgUrl: 'assets/icons/hackerearth.svg',
    contestUrl: 'www.hackerearth.com',
  ),
  ListContainer(
    number: "4",
    title: "HackerRank Weekly Contest",
    durationInHr: "10800", // 3 hours in seconds
    startTime: "2024-12-04T10:00:00Z",
    endTime: "2024-12-04T13:00:00Z",
    imgUrl: 'assets/icons/hackerrank.svg',
    contestUrl: 'www.hackerrank.com',
  ),
  ListContainer(
    number: "5",
    title: "LeetCode Biweekly Contest 125",
    durationInHr: "5400", // 1.5 hours in seconds
    startTime: "2024-12-05T07:30:00Z",
    endTime: "2024-12-05T09:00:00Z",
    imgUrl: 'assets/icons/leetcode.svg',
    contestUrl: 'www.leetcode.com',
  ),
  ListContainer(
    number: "6",
    title: "Kick Start Round G",
    durationInHr: "7200", // 2 hours in seconds
    startTime: "2024-12-06T15:00:00Z",
    endTime: "2024-12-06T17:00:00Z",
    imgUrl: 'assets/icons/google.svg',
    contestUrl: 'www.codingcompetitions.withgoogle.com',
  ),
  ListContainer(
    number: "7",
    title: "TopCoder SRM 871",
    durationInHr: "5400", // 1.5 hours in seconds
    startTime: "2024-12-07T20:00:00Z",
    endTime: "2024-12-07T21:30:00Z",
    imgUrl: 'assets/icons/topcoder.svg',
    contestUrl: 'www.topcoder.com',
  ),
  ListContainer(
    number: "8",
    title: "AtCoder Beginner Contest 325",
    durationInHr: "7200", // 2 hours in seconds
    startTime: "2024-12-08T05:00:00Z",
    endTime: "2024-12-08T07:00:00Z",
    imgUrl: 'assets/icons/atcoder.svg',
    contestUrl: 'www.atcoder.jp',
  ),
  ListContainer(
    number: "9",
    title: "CS Academy Open Contest",
    durationInHr: "10800", // 3 hours in seconds
    startTime: "2024-12-09T08:00:00Z",
    endTime: "2024-12-09T11:00:00Z",
    imgUrl: 'assets/icons/csAcademy.svg',
    contestUrl: 'www.csacademy.com',
  ),
];
