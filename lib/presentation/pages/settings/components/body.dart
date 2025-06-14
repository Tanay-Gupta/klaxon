import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../infrastructure/services/url/url_launcher_service.dart';
import '../../../values/constants.dart';
import '../../../values/values.dart';
import 'about_page.dart';
import 'setting_tile.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  final launcher = UrlLauncherService();
  // final _darkModeController = ValueNotifier<bool>(true);
  final _upcomingEventsController = ValueNotifier<bool>(false);
  final _newEventsController = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          // Text('General', style: kHeadingextStyle),
          // const SizedBox(height: 24),

          // SettingTile(
          //   title: 'TimeZone',
          //   subtitle: 'Select your preferred timezone',
          //   trailing: Padding(
          //     padding: const EdgeInsets.only(left: 12.0),
          //     child: Text(
          //       'GMT+5:30',
          //       style: kSubheadingtextStyle.copyWith(
          //         fontWeight: FontWeight.w400,
          //       ),
          //     ),
          //   ),
          // ),

          // const SizedBox(height: 24),

          // SettingTile(
          //   title: 'Theme',
          //   subtitle: 'Dark mode is currently enabled',
          //   trailing: Padding(
          //     padding: const EdgeInsets.only(left: 12.0),
          //     child: AdvancedSwitch(
          //       activeColor: kButtonColor,
          //       inactiveColor: kNavUnselectedIconColor,
          //       controller: _darkModeController,
          //       enabled: false,
          //       initialValue: true,
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 16),
          // Divider(color: kNavUnselectedIconColor, thickness: 1),
          // const SizedBox(height: 16),
          Text('Notifications', style: kHeadingextStyle),
          const SizedBox(height: 24),

          SettingTile(
            title: 'Upcoming Events',
            subtitle: 'Get notified about upcoming events',
            trailing: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: AdvancedSwitch(
                initialValue: true,
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
                initialValue: true,
              ),
            ),
          ),

          // const SizedBox(height: 32),
          // Text('Reminders', style: kHeadingextStyle),
          const SizedBox(height: 20),

          InkWell(
            onTap: () => context.push('/scheduledNotifications'),
            child: SettingTile(
              title: 'Manage Reminders',
              subtitle: 'All your reminders in one place',
              trailing: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: SvgPicture.asset(
                  "assets/icons/settings_page/arrow_right.svg",
                ),
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
              context.push('/about');
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
          InkWell(
            onTap: () async {
              await launcher.launchEmail(
                toEmail: 'mail.miraidyo@gmai.com',
                subject: 'Contact: ContestHunt',
                body: 'Hey team, please add this new contest platform...',
              );
            },
            child: SettingTile(
              title: 'Contact Us',
              subtitle: 'Get in touch with us',
              trailing: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: SvgPicture.asset(
                  "assets/icons/settings_page/arrow_right.svg",
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () async {
              await launcher.launchUrlInBrowser(
                'https://play.google.com/store/apps/details?id=com.miraidyo.contesthunt',
              );
            },
            child: SettingTile(
              title: 'Rate Us',
              subtitle: 'Rate us on the Play Store',
              trailing: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: SvgPicture.asset(
                  "assets/icons/settings_page/arrow_right.svg",
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              SharePlus.instance.share(ShareParams(text: shareAppText.trim()));
            },
            child: SettingTile(
              title: 'Share',
              subtitle: 'Share ContestHunt with your friends',
              trailing: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: SvgPicture.asset(
                  "assets/icons/settings_page/arrow_right.svg",
                ),
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
