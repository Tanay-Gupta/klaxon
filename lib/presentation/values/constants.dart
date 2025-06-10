import 'package:flutter/material.dart';


//------------------------------------------------------App Colors------------------------------------------------------
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

//----------------------------------------------------------Styles----------------------------------------------------------
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

//----------------------------------------------------------Text Styles----------------------------------------------------------
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
const kH1textStyle = TextStyle(
  overflow: TextOverflow.visible,
  fontSize: 22,
  color: kTextColor,
  fontFamily: "Rubik",
  fontWeight: FontWeight.bold,
);
const kH1SubHeadingtextStyle = TextStyle(
  overflow: TextOverflow.ellipsis,
  fontSize: 16,
  color: Color(0xffA6A6A6),
  fontWeight: FontWeight.w500,
  fontFamily: "Rubik",
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


