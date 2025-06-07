import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klaxon/presentation/pages/settings/settings_page.dart';

import '../values/constants.dart';
import '../widgets/UnderMaintenanceScreen.dart';
import '../widgets/connectError.dart';
import 'homePage/home_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _tabItems = const [
    HomePage(),
    UnderMaintenanceScreen(),
    NoconnectionScreen(),
    UnderMaintenanceScreen(),
    SettingsPage(),
  ];

  final List<FlashyTabBarItem> _navItems = [
    _buildTabBarItem("assets/icons/home/home_dark_unselected.svg", 'Explore'),
    _buildTabBarItem(
      "assets/icons/home/contest_dark_unselected.svg",
      'Contests',
    ),
    _buildTabBarItem(
      "assets/icons/home/hackathon_dark_unselected.svg",
      'Hackathons',
    ),
    _buildTabBarItem("assets/icons/home/bounty_dark_unselected.svg", 'Bounty'),
    _buildTabBarItem(
      "assets/icons/home/settings_dark_unselected.svg",
      'Settings',
    ),
  ];

  static FlashyTabBarItem _buildTabBarItem(String assetPath, String label) {
    return FlashyTabBarItem(
      icon: SvgPicture.asset(
        assetPath,
        width: 22,
        height: 22,
        colorFilter: const ColorFilter.mode(
          kNavUnselectedIconColor,
          BlendMode.srcIn,
        ),
      ),
      title: Text(label, style: kNavIconTextStyle),
      activeColor: kNavIconTextColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabItems[_selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        backgroundColor: kNavBackgroundColorDark,

        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 15,
        height: 55,
        showElevation: true,
        onItemSelected: (index) => setState(() => _selectedIndex = index),
        items: _navItems,
      ),
    );
  }
}
