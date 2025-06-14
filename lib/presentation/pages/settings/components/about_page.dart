import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../infrastructure/services/url/url_launcher_service.dart';
import '../../../values/constants.dart';
import '../../../values/values.dart';
import 'setting_tile.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final launcher = UrlLauncherService();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kAppbarTitleTextColor),
        title: Text('About', style: kAppbarTitleStyle),
        backgroundColor: kBackgroundColor,
        surfaceTintColor: kBackgroundColor,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            InkWell(
                              onTap: () async {
                                await launcher.launchUrlInBrowser(
                                  privacyPolicyUrl,
                                );
                              },
                              child: SettingTile(
                                title: 'Privacy Policy',
                                subtitle: 'Read our privacy policy',
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
                                  termAndConditionUrl,
                                );
                              },
                              child: SettingTile(
                                title: 'Terms of Service',
                                subtitle: 'Read our terms of service',
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
                                  toEmail: 'mail.miraidyo@gmail.com',
                                  subject: 'Feedback: ContestHunt',
                                  body: dummyFeedback,
                                );
                              },
                              child: SettingTile(
                                title: 'Feedback',
                                subtitle: 'Send us your feedback',
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
                              title: 'Version',
                              subtitle: 'v1.0.0',
                              trailing: const SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: kSubheading2textStyle,
                            children: [
                              const TextSpan(
                                text:
                                    "Never miss a contest. Never miss a chance — ContestHunt 💜 x ",
                              ),
                              TextSpan(
                                text: 'MiraiDyo',
                                style: const TextStyle(
                                  color: kButtonColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () async {
                                        // await launcher.launchUrlInBrowser(
                                        //   'https://mirai.link',
                                        // ); // your URL
                                      },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
