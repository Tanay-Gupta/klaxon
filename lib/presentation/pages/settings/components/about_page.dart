import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../values/constants.dart';
import 'setting_tile.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
      iconTheme: const IconThemeData(
          color: kAppbarTitleTextColor, // Set the icon color
        ),
        title: Text('About', style: kAppbarTitleStyle),
        backgroundColor: kBackgroundColor,
        surfaceTintColor: kBackgroundColor,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SettingTile(
                title: 'Privacy Policy',
                subtitle: 'Read our privacy policy',
                trailing: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: SvgPicture.asset(
                    "assets/icons/settings_page/arrow_right.svg",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SettingTile(
                title: 'Terms of Service',
                subtitle: 'Read our terms of service',
                trailing: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: SvgPicture.asset(
                    "assets/icons/settings_page/arrow_right.svg",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SettingTile(
                title: 'Feedback',
                subtitle: 'Send us your feedback',
                trailing: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: SvgPicture.asset(
                    "assets/icons/settings_page/arrow_right.svg",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SettingTile(
                title: 'Version',
                subtitle: 'v1.0.0',
                trailing: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: SvgPicture.asset(
                    "assets/icons/settings_page/arrow_right.svg",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
