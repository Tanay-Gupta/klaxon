import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:klaxon/presentation/pages/homePage/components/body.dart';
import '../../values/constants.dart';
import '../notificationPage/notification_screen.dart';

class HomePage extends StatelessWidget {
  final Function(int)? onNavigateToTab;
  const HomePage({super.key, this.onNavigateToTab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false, // Allow body to go under AppBar
      // backgroundColor: Colors.transparent,
      backgroundColor: kBackgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: RichText(
          text: TextSpan(
            children: const [
              TextSpan(text: 'Contest', style: kAppbarTitleStyle),
              TextSpan(text: 'Hunt', style: kAppbarTitleSecondaryStyle),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/home_screen/notification_bell.svg",
            ),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EmptyNotificationsScreen(),
                  ),
                ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
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
        ),
        child: SafeArea(
          top: false, // We'll manually pad for AppBar
          child: HomeBody(onNavigateToTab: onNavigateToTab),
        ),
      ),
    );
  }
}
