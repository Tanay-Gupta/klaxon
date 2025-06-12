import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../values/constants.dart';

// 🔔 Widget for Reminder Row
class EventReminderRow extends StatelessWidget {
  const EventReminderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icons/reminder.svg'),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Set a reminder",
              style: kH1SubHeadingtextStyle.copyWith(color: Colors.white),
            ),
            Text(
              "You will be notified before event",
              style: kH1SubHeadingtextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
