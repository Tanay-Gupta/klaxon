import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:klaxon/infrastructure/models/hackathon_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:klaxon/presentation/values/platform_master.dart';
import '../../../../infrastructure/services/notifications/schedule_contest_reminders.dart';
import '../../../values/constants.dart';
import '../../../values/values.dart';

class HackathonDetailBody extends StatefulWidget {
  final HackathonModel contest;

  const HackathonDetailBody({super.key, required this.contest});

  @override
  State<HackathonDetailBody> createState() => _ContestDetailBodyState();
}

class _ContestDetailBodyState extends State<HackathonDetailBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String formatTimestamp(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('MMMM dd, yyyy • hh:mm a').format(date);
  }

  String formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  }

  @override
  Widget build(BuildContext context) {
    final contest = widget.contest;
    final startTime = formatTimestamp(contest.startTime ?? 0);
    final endTime = formatTimestamp(contest.endTime ?? 0);
    final duration = formatDuration(contest.duration ?? 0);
    final isUpcoming = DateTime.fromMillisecondsSinceEpoch(
      contest.startTime! * 1000,
    ).isAfter(DateTime.now());
    final platformImg = platformLogos[contest.platform];
    final platformName = platformDisplayNames[contest.platform];

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF121212), Color(0xFF1E1E1E)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🎯 Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (platformImg != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SvgPicture.asset(
                          platformImg,
                          width: 48,
                          height: 48,
                        ),
                      ),
                    ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contest.name ?? "No Title",
                          style: kH1textStyle.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Hosted by $platformName",
                          style: kH1SubHeadingtextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // 🕒 Info Card
              _buildInfoCard([
                _buildInfoTile("Start Time", startTime),
                _buildInfoTile("End Time", endTime),
                _buildInfoTile("Duration", duration),
                _buildInfoTile("Mode", (contest.mode ?? "N/A").toUpperCase()),
              ]),

              const SizedBox(height: 28),

              // 🎯 Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (isUpcoming)
                    _modernButton(
                      icon: Icons.notifications_active,
                      label: "Set Reminder",
                      onPressed: () async {
                        final success = await scheduleContestReminders(
                          startTimeEpoch: contest.startTime!,
                          contestName: contest.name ?? 'Coding Contest',
                        );
                        if (success && context.mounted) {
                          final message =
                              kFunnyNotificationMessages[Random().nextInt(
                                kFunnyNotificationMessages.length,
                              )];
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(message)));
                        }
                      },
                    ),
                  _modernButton(
                    icon: Icons.open_in_browser,
                    label: "Open Site",
                    onPressed: () async {
                      final url = Uri.tryParse(contest.url ?? '');

                      await launchUrl(url!);
                    },
                  ),
                  _modernButton(
                    icon: Icons.share,
                    label: "Share",
                    onPressed: () {
                      final shareText = '''
🚀 ${contest.name}
📅 Starts: $startTime
🌐 Platform: $platformName
🔗 ${contest.url ?? ''}

Check this out on Contest Hunt!
''';
                      SharePlus.instance.share(
                        ShareParams(text: shareText.trim()),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 28),
              Divider(color: Colors.white10),
              const SizedBox(height: 24),

              // 📄 Description
              Text('Event Description', style: kHeadingextStyle),
              const SizedBox(height: 12),
              _buildDescription(contest.description),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(10),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withAlpha(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(51),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label: ", style: kH1SubHeadingtextStyle),
          Expanded(
            child: Text(
              value,
              style: kH1SubHeadingtextStyle.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _modernButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // backgroundColor: const Color(0xFF1F1F1F),
            // foregroundColor: Colors.white,
            backgroundColor: kButtonColor.withAlpha(40),
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              //  side: BorderSide(color: Colors.white.withAlpha(26)),
            ),
          ),
          onPressed: onPressed,
          child: Column(
            children: [
              Icon(icon, size: 22, color: kButtonColor),
              const SizedBox(height: 4),
              Text(
                label,
                style: kSubheadingtextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDescription(String? content) {
    final isMarkdown =
        content != null &&
        (content.contains('```') ||
            content.contains('##') ||
            content.contains('*'));

    final descriptionData =
        content?.isNotEmpty == true ? content! : "No description available.";

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      // decoration: BoxDecoration(
      //   color: Colors.white.withAlpha((0.08 * 255).toInt()), // 0.08 opacity
      //   borderRadius: BorderRadius.circular(16),
      //   border: Border.all(
      //     color: Colors.white.withAlpha((0.08 * 255).toInt()), // 0.08 opacity
      //   ),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withAlpha(38),
      //       blurRadius: 8,
      //       offset: const Offset(0, 4),
      //     ),
      //   ],
      // ),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(10),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withAlpha(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(51),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child:
          isMarkdown
              ? MarkdownBody(
                data: descriptionData,
                styleSheet: MarkdownStyleSheet(
                  p: const TextStyle(color: Colors.white, fontSize: 15),
                  h1: const TextStyle(color: Colors.white, fontSize: 18),
                  h2: const TextStyle(color: Colors.white, fontSize: 16),
                  code: const TextStyle(
                    backgroundColor: Color(0xFF1E1E1E),
                    color: Colors.lightGreenAccent,
                  ),
                ),
              )
              : Html(
                data: descriptionData,
                style: {
                  "body": Style(
                    color: Colors.white.withAlpha(230),
                    fontSize: FontSize(15),
                    lineHeight: LineHeight.number(1.6),
                    padding: HtmlPaddings.zero,
                    margin: Margins.zero,
                  ),
                },
              ),
    );
  }
}
