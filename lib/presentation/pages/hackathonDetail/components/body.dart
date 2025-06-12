import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:klaxon/infrastructure/models/hackathon_model.dart';
import 'package:klaxon/presentation/widgets/event_action_button.dart';
import '../../../values/constants.dart';
import '../../../values/platform_master.dart';
import '../../../widgets/event_reminder_row.dart';

// 📝 Main Event Detail Body Widget
class HackathonDetailBody extends StatelessWidget {
  final HackathonModel contest;

  const HackathonDetailBody({super.key, required this.contest});

  // 🕒 Format timestamp to readable string
  String formatTimestamp(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('MMMM dd, yyyy • hh:mm a').format(date);
  }

  // ⏳ Format duration in hours and minutes
  String formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  }

  @override
  Widget build(BuildContext context) {
    final startTime = formatTimestamp(contest.startTime ?? 0);
    final endTime = formatTimestamp(contest.endTime ?? 0);
    final duration = formatDuration(contest.duration ?? 0);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🎯 Contest Name
          Text(contest.name ?? "", style: kH1textStyle),
          const SizedBox(height: 8),
          Text("Hosted by ${platformDisplayNames[contest.platform]}", style: kH1SubHeadingtextStyle),
          const SizedBox(height: 10),
          Divider(color: kNavUnselectedIconColor, thickness: 1),

          // 🕑 Start Time
          Text("Start Time", style: kH1SubHeadingtextStyle),
          const SizedBox(height: 5),
          Text(
            startTime,
            style: kH1SubHeadingtextStyle.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 10),

          // 🕔 End Time
          Text("End Time", style: kH1SubHeadingtextStyle),
          const SizedBox(height: 5),
          Text(
            endTime,
            style: kH1SubHeadingtextStyle.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 10),

          // ⏱ Duration
          Text("Duration", style: kH1SubHeadingtextStyle),
          const SizedBox(height: 5),
          Text(
            duration,
            style: kH1SubHeadingtextStyle.copyWith(color: Colors.white),
          ),
           const SizedBox(height: 10),
          // ⏱ Mode
          Text("Hackathon mode", style: kH1SubHeadingtextStyle),
          const SizedBox(height: 5),
          Text(
            contest.mode??"N/A",
            style: kH1SubHeadingtextStyle.copyWith(color: Colors.white),
          ),
          Divider(color: kNavUnselectedIconColor, thickness: 1),
          const SizedBox(height: 16),

          // 🔔 Reminder Section
          Text('Reminder', style: kHeadingextStyle),
          const SizedBox(height: 16),
          const EventReminderRow(),
          const SizedBox(height: 16),
          EventActionButton(
            label: "Activate Reminder",
            onPressed: () {
              // TODO: Implement reminder activation logic
            },
          ),
          const SizedBox(height: 16),
          Divider(color: kNavUnselectedIconColor, thickness: 1),
          const SizedBox(height: 16),

          // 📄 Event Details Section
          Text('Event Description', style: kHeadingextStyle),
          const SizedBox(height: 8),
          Html(
            data: contest.description!=null && contest.description!.isNotEmpty ? contest.description:  " No description available",
            style: {"body": Style(color: Colors.white)},
          ),
          const SizedBox(height: 16),
          EventActionButton(
            label: "Open Site",
            onPressed: () {
              
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
