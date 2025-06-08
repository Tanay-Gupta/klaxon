import 'package:flutter/material.dart';

import '../pages/homePage/components/listcontainer.dart';

// // Colors

//----Navigation Bar Colors
const kNavIconTextColor = Colors.white;
const kNavBackgroundColorDark = Color(0xFF030303);
const kNavUnselectedIconColor = Color(0xffA6A6A6);

// ----Home Page AppBar Colors
const kHomePageAppBarColor = Color(0xFF030303);
const kHomePageAppBarIconColor = Color(0xFFA6A6A6);
const kHomePageTitleTextPrimaryColor = Colors.white;
const kHomePageTitleTextSecondaryColor = Color(0xFF8C45FF);

//----AppBar Colors
const kTextColor = Colors.white;
const kAppbarTitleTextColor = Colors.white;

//----button Colors
const kButtonColor = Color(0xFF8C45FF);

//----list container Colors
const kListContainerSplashColor = Colors.white24;
const kListContainerHighlightColor = Colors.white10;
const kListContainerBGColor = Color(0xff110919);

//----Platform Grid Colors
const kPlatformGridBGColor = Color(0xff110919);
//----segmented tab Colors
const kSegmentedTabBGColor = Color(0xff110919);
const kSegmentedTabSelectedColor = Color(0xff2C114A);

const kBackgroundColor = Color(0xFF030303);

const kHomePageBGGradientDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF020202), // Top black
      Color(0xFF2C114A), // Middle purple
      Color(0xFF030303), // Bottom black
    ],
    stops: [0.0, 0.5, 1.0],
  ),
);


// My Text Styles
const kAppbarTitleStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  fontSize: 20,
  color: kAppbarTitleTextColor,
  fontFamily: "Rubik",
  fontWeight: FontWeight.bold,
);
const kAppbarTitleSecondaryStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  fontSize: 20,
  color: kHomePageTitleTextSecondaryColor,
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
const kListContainerTextStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  fontSize: 12,
  color: Color(0xffA6A6A6),
  fontFamily: "Rubik",
  fontWeight: FontWeight.w500,
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
    title: "CodeChef Long Challenge",
    //  durationInHr: "10800", // 3 hours in seconds
    startTime: "2024-12-01T09:00:00Z",
    endTime: "2024-12-01T12:00:00Z",
    imgUrl: 'assets/icons/codechef.svg',
    contestUrl: 'www.codechef.com',
  ),
  ListContainer(
    title: "CodeForces Round #891",
    //  durationInHr: "7200", // 2 hours in seconds
    startTime: "2024-12-02T14:00:00Z",
    endTime: "2024-12-02T16:00:00Z",
    imgUrl: 'assets/icons/codeforces.svg',
    contestUrl: 'www.codeforces.com',
  ),
  ListContainer(
    title: "HackerEarth Coding Challenge",
    //  durationInHr: "14400", // 4 hours in seconds
    startTime: "2024-12-03T18:00:00Z",
    endTime: "2024-12-03T22:00:00Z",
    imgUrl: 'assets/icons/hackerearth.svg',
    contestUrl: 'www.hackerearth.com',
  ),
  ListContainer(
    title: "HackerRank Weekly Contest",
    // durationInHr: "10800", // 3 hours in seconds
    startTime: "2024-12-04T10:00:00Z",
    endTime: "2024-12-04T13:00:00Z",
    imgUrl: 'assets/icons/hackerrank.svg',
    contestUrl: 'www.hackerrank.com',
  ),
  ListContainer(
    title: "LeetCode Biweekly Contest 125",
    // durationInHr: "5400", // 1.5 hours in seconds
    startTime: "2024-12-05T07:30:00Z",
    endTime: "2024-12-05T09:00:00Z",
    imgUrl: 'assets/icons/leetcode.svg',
    contestUrl: 'www.leetcode.com',
  ),
  ListContainer(
    title: "Kick Start Round G",
    //  durationInHr: "7200", // 2 hours in seconds
    startTime: "2024-12-06T15:00:00Z",
    endTime: "2024-12-06T17:00:00Z",
    imgUrl: 'assets/icons/google.svg',
    contestUrl: 'www.codingcompetitions.withgoogle.com',
  ),
  ListContainer(
    title: "TopCoder SRM 871",
    //  durationInHr: "5400", // 1.5 hours in seconds
    startTime: "2024-12-07T20:00:00Z",
    endTime: "2024-12-07T21:30:00Z",
    imgUrl: 'assets/icons/topcoder.svg',
    contestUrl: 'www.topcoder.com',
  ),
  ListContainer(
    title: "AtCoder Beginner Contest 325",
    //  durationInHr: "7200", // 2 hours in seconds
    startTime: "2024-12-08T05:00:00Z",
    endTime: "2024-12-08T07:00:00Z",
    imgUrl: 'assets/icons/atcoder.svg',
    contestUrl: 'www.atcoder.jp',
  ),
  ListContainer(
    title: "CS Academy Open Contest",
    //  durationInHr: "10800", // 3 hours in seconds
    startTime: "2024-12-09T08:00:00Z",
    endTime: "2024-12-09T11:00:00Z",
    imgUrl: 'assets/icons/csAcademy.svg',
    contestUrl: 'www.csacademy.com',
  ),
];
// //-- teal based color

// //----Navigation Bar Colors
// const kNavIconTextColor = Colors.white;
// const kNavBackgroundColorDark = Color(0xFF030303);
// const kNavUnselectedIconColor = Color(0xffA6A6A6);

// // ----Home Page AppBar Colors
// const kHomePageAppBarColor = Color(0xFF030303);
// const kHomePageAppBarIconColor = Color(0xFFA6A6A6);
// const kHomePageTitleTextPrimaryColor = Colors.white;
// const kHomePageTitleTextSecondaryColor = Color(0xFF00BFA5); // Teal

// //----AppBar Colors
// const kTextColor = Colors.white;
// const kAppbarTitleTextColor = Colors.white;

// //----button Colors
// const kButtonColor = Color(0xFF00897B); // Teal Dark

// //----list container Colors
// const kListContainerSplashColor = Colors.white24;
// const kListContainerHighlightColor = Colors.white10;
// const kListContainerBGColor = Color(0xff110919);

// //----Platform Grid Colors
// const kPlatformGridBGColor = Color(0xff110919);
// //----segmented tab Colors
// const kSegmentedTabBGColor = Color(0xff110919);
// const kSegmentedTabSelectedColor = Color(0xff004D40); // Deep Teal

// const kBackgroundColor = Color(0xFF030303);

// const kHomePageBGGradientDecoration = BoxDecoration(
//   gradient: LinearGradient(
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//     colors: [
//       Color(0xFF020202),
//       Color(0xFF004D40), // Teal
//       Color(0xFF030303),
//     ],
//     stops: [0.0, 0.5, 1.0],
//   ),
// );

//-- blue based color

// //----Navigation Bar Colors
// const kNavIconTextColor = Colors.white;
// const kNavBackgroundColorDark = Color(0xFF030303);
// const kNavUnselectedIconColor = Color(0xffA6A6A6);

// // ----Home Page AppBar Colors
// const kHomePageAppBarColor = Color(0xFF030303);
// const kHomePageAppBarIconColor = Color(0xFFA6A6A6);
// const kHomePageTitleTextPrimaryColor = Colors.white;
// const kHomePageTitleTextSecondaryColor = Color(0xFF42A5F5); // Light Blue

// //----AppBar Colors
// const kTextColor = Colors.white;
// const kAppbarTitleTextColor = Colors.white;

// //----button Colors
// const kButtonColor = Color(0xFF1E88E5); // Blue

// //----list container Colors
// const kListContainerSplashColor = Colors.white24;
// const kListContainerHighlightColor = Colors.white10;
// const kListContainerBGColor = Color(0xff110919);

// //----Platform Grid Colors
// const kPlatformGridBGColor = Color(0xff110919);
// //----segmented tab Colors
// const kSegmentedTabBGColor = Color(0xff110919);
// const kSegmentedTabSelectedColor = Color(0xff0D47A1); // Dark Blue

// const kBackgroundColor = Color(0xFF030303);

// const kHomePageBGGradientDecoration = BoxDecoration(
//   gradient: LinearGradient(
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//     colors: [
//       Color(0xFF020202),
//       Color(0xFF0D47A1),
//       Color(0xFF030303),
//     ],
//     stops: [0.0, 0.5, 1.0],
//   ),
// );


//--- orange/amber based color

// //----Navigation Bar Colors
// const kNavIconTextColor = Colors.white;
// const kNavBackgroundColorDark = Color(0xFF030303);
// const kNavUnselectedIconColor = Color(0xffA6A6A6);

// // ----Home Page AppBar Colors
// const kHomePageAppBarColor = Color(0xFF030303);
// const kHomePageAppBarIconColor = Color(0xFFA6A6A6);
// const kHomePageTitleTextPrimaryColor = Colors.white;
// const kHomePageTitleTextSecondaryColor = Color(0xFFFFB300); // Amber

// //----AppBar Colors
// const kTextColor = Colors.white;
// const kAppbarTitleTextColor = Colors.white;

// //----button Colors
// const kButtonColor = Color(0xFFF57C00); // Deep Orange

// //----list container Colors
// const kListContainerSplashColor = Colors.white24;
// const kListContainerHighlightColor = Colors.white10;
// const kListContainerBGColor = Color(0xff110919);

// //----Platform Grid Colors
// const kPlatformGridBGColor = Color(0xff110919);
// //----segmented tab Colors
// const kSegmentedTabBGColor = Color(0xff110919);
// const kSegmentedTabSelectedColor = Color(0xffE65100); // Dark Orange

// const kBackgroundColor = Color(0xFF030303);

// const kHomePageBGGradientDecoration = BoxDecoration(
//   gradient: LinearGradient(
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//     colors: [
//       Color(0xFF020202),
//       Color(0xFFE65100),
//       Color(0xFF030303),
//     ],
//     stops: [0.0, 0.5, 1.0],
//   ),
// );


//--green based color
//----Navigation Bar Colors
// const kNavIconTextColor = Colors.white;
// const kNavBackgroundColorDark = Color(0xFF030303);
// const kNavUnselectedIconColor = Color(0xffA6A6A6);

// // ----Home Page AppBar Colors
// const kHomePageAppBarColor = Color(0xFF030303);
// const kHomePageAppBarIconColor = Color(0xFFA6A6A6);
// const kHomePageTitleTextPrimaryColor = Colors.white;
// const kHomePageTitleTextSecondaryColor = Color(0xFF66BB6A); // Light Green

// //----AppBar Colors
// const kTextColor = Colors.white;
// const kAppbarTitleTextColor = Colors.white;

// //----button Colors
// const kButtonColor = Color(0xFF43A047); // Green

// //----list container Colors
// const kListContainerSplashColor = Colors.white24;
// const kListContainerHighlightColor = Colors.white10;
// const kListContainerBGColor = Color(0xff110919);

// //----Platform Grid Colors
// const kPlatformGridBGColor = Color(0xff110919);
// //----segmented tab Colors
// const kSegmentedTabBGColor = Color(0xff110919);
// const kSegmentedTabSelectedColor = Color(0xff1B5E20); // Dark Green

// const kBackgroundColor = Color(0xFF030303);

// const kHomePageBGGradientDecoration = BoxDecoration(
//   gradient: LinearGradient(
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//     colors: [
//       Color(0xFF020202),
//       Color(0xFF1B5E20),
//       Color(0xFF030303),
//     ],
//     stops: [0.0, 0.5, 1.0],
//   ),
// );


//---- red based color

// //----Navigation Bar Colors
// const kNavIconTextColor = Colors.white;
// const kNavBackgroundColorDark = Color(0xFF030303);
// const kNavUnselectedIconColor = Color(0xffA6A6A6);

// // ----Home Page AppBar Colors
// const kHomePageAppBarColor = Color(0xFF030303);
// const kHomePageAppBarIconColor = Color(0xFFA6A6A6);
// const kHomePageTitleTextPrimaryColor = Colors.white;
// const kHomePageTitleTextSecondaryColor = Color(0xFFEF5350); // Light Red

// //----AppBar Colors
// const kTextColor = Colors.white;
// const kAppbarTitleTextColor = Colors.white;

// //----button Colors
// const kButtonColor = Color(0xFFD32F2F); // Red

// //----list container Colors
// const kListContainerSplashColor = Colors.white24;
// const kListContainerHighlightColor = Colors.white10;
// const kListContainerBGColor = Color(0xff110919);

// //----Platform Grid Colors
// const kPlatformGridBGColor = Color(0xff110919);
// //----segmented tab Colors
// const kSegmentedTabBGColor = Color(0xff110919);
// const kSegmentedTabSelectedColor = Color(0xffB71C1C); // Dark Red

// const kBackgroundColor = Color(0xFF030303);

// const kHomePageBGGradientDecoration = BoxDecoration(
//   gradient: LinearGradient(
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//     colors: [
//       Color(0xFF020202),
//       Color(0xFFB71C1C),
//       Color(0xFF030303),
//     ],
//     stops: [0.0, 0.5, 1.0],
//   ),
// );


// Colors
///----Eye-Friendly Dark Theme Colors---------------------
// // Colors

// //----Navigation Bar Colors
// const kNavIconTextColor = Color(0xFFE0E0E0); // Softer white for text
// const kNavBackgroundColorDark = Color(0xFF1A1A1A); // Soft dark grey
// const kNavUnselectedIconColor = Color(0xFF8C8C8C); // Cool muted grey

// // ----Home Page AppBar Colors
// const kHomePageAppBarColor = Color(0xFF1A1A1A); // Matches nav bar
// const kHomePageAppBarIconColor = Color(0xFF8C8C8C); // Muted icon color
// const kHomePageTitleTextPrimaryColor = Color(0xFFE0E0E0); // Off-white text
// const kHomePageTitleTextSecondaryColor = Color(0xFF9E8FFF); // Soft lavender

// //----AppBar Colors
// const kTextColor = Color(0xFFE0E0E0); // Uniform text contrast
// const kAppbarTitleTextColor = Color(0xFFE0E0E0); // Match above

// //----button Colors
// const kButtonColor = Color(0xFF6C63FF); // Muted indigo (eye-friendly)

// //----list container Colors
// const kListContainerSplashColor = Colors.white24;
// const kListContainerHighlightColor = Colors.white10;
// const kListContainerBGColor = Color(0xFF1F1B2E); // Dark grey-blue

// //----Platform Grid Colors
// const kPlatformGridBGColor = Color(0xFF1F1B2E); // Consistent with container

// //----segmented tab Colors
// const kSegmentedTabBGColor = Color(0xFF1F1B2E); // Consistent background
// const kSegmentedTabSelectedColor = Color(0xFF3E2A5E); // Desaturated purple

// //----Background Color
// const kBackgroundColor = Color(0xFF121212); // Deep charcoal (safe dark)

// //----Home Page Gradient
// const kHomePageBGGradientDecoration = BoxDecoration(
//   gradient: LinearGradient(
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//     colors: [
//       Color(0xFF121212), // Top
//       Color(0xFF1F1B2E), // Middle soft purple
//       Color(0xFF121212), // Bottom
//     ],
//     stops: [0.0, 0.5, 1.0],
//   ),
// );

