import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../values/constants.dart';
import 'about_page.dart';
import 'setting_tile.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  final _darkModeController = ValueNotifier<bool>(true);
  final _upcomingEventsController = ValueNotifier<bool>(true);
  final _newEventsController = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Text('General', style: kHeadingextStyle),
          const SizedBox(height: 24),

          SettingTile(
            title: 'TimeZone',
            subtitle: 'Select your preferred timezone',
            trailing: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                'GMT+5:30',
                style: kSubheadingtextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          SettingTile(
            title: 'Theme',
            subtitle: 'Dark mode is currently enabled',
            trailing: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: AdvancedSwitch(
                activeColor: kButtonColor,
                inactiveColor: kNavUnselectedIconColor,
                controller: _darkModeController,
                enabled: false,
                initialValue: true,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Divider(color: kNavUnselectedIconColor, thickness: 1),
          const SizedBox(height: 16),
          Text('Notifications', style: kHeadingextStyle),
          const SizedBox(height: 24),

          SettingTile(
            title: 'Upcoming Events',
            subtitle: 'Get notified about upcoming events',
            trailing: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: AdvancedSwitch(
                activeColor: kButtonColor,
                inactiveColor: kNavUnselectedIconColor,
                controller: _upcomingEventsController,
              ),
            ),
          ),

          const SizedBox(height: 20),

          SettingTile(
            title: 'New Events',
            subtitle: 'Get notified about new events',
            trailing: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: AdvancedSwitch(
                activeColor: kButtonColor,
                inactiveColor: kNavUnselectedIconColor,
                controller: _newEventsController,
              ),
            ),
          ),

          // const SizedBox(height: 32),
          // Text('Reminders', style: kHeadingextStyle),
          const SizedBox(height: 20),

          SettingTile(
            title: 'Manage Reminders',
            subtitle: 'All your reminders in one place',
            trailing: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: SvgPicture.asset(
                "assets/icons/settings_page/arrow_right.svg",
              ),
            ),
          ),
          const SizedBox(height: 16),
          Divider(color: kNavUnselectedIconColor, thickness: 1),
          const SizedBox(height: 16),
          Text('More info and support', style: kHeadingextStyle),
          const SizedBox(height: 24),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
            child: SettingTile(
              title: 'About',
              subtitle: 'Learn more about AlgoHunt',
              trailing: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: SvgPicture.asset(
                  "assets/icons/settings_page/arrow_right.svg",
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          SettingTile(
            title: 'Contact Us',
            subtitle: 'Get in touch with us',
            trailing: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: SvgPicture.asset(
                "assets/icons/settings_page/arrow_right.svg",
              ),
            ),
          ),
          const SizedBox(height: 20),
          SettingTile(
            title: 'Rate Us',
            subtitle: 'Rate us on the Play Store',
            trailing: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: SvgPicture.asset(
                "assets/icons/settings_page/arrow_right.svg",
              ),
            ),
          ),
          const SizedBox(height: 20),
          SettingTile(
            title: 'Share',
            subtitle: 'Share Klaxon with your friends',
            trailing: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: SvgPicture.asset(
                "assets/icons/settings_page/arrow_right.svg",
              ),
            ),
          ),
          const SizedBox(height: 20),

          // const SizedBox(height: 20),
          // SettingTile(
          //   title: 'Logout',
          //   subtitle: 'Logout from your account',
          //   trailing: Padding(
          //     padding: const EdgeInsets.only(left: 12.0),
          //     child: SvgPicture.asset(
          //       "assets/icons/settings_page/arrow_right.svg",
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 20),
          // SettingTile(
          //   title: 'Delete Account',
          //   subtitle: 'Permanently delete your account',
          //   trailing: Padding(
          //     padding: const EdgeInsets.only(left: 12.0),
          //     child: SvgPicture.asset(
          //       "assets/icons/settings_page/arrow_right.svg",
          //     ),
          //   ),
          // ),

          // const SizedBox(height: 20),
        ],
      ),
    );
  }
}
