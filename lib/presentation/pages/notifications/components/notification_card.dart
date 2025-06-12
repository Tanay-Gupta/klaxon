import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../infrastructure/models/scheduled_notification.dart';
import '../../../values/constants.dart';
 // make sure this imports your theme file

class NotificationCard extends StatelessWidget {
  final ScheduledNotification notification;
  final VoidCallback onDelete;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      decoration: BoxDecoration(
        color: kListContainerBGColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(77),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text(
          notification.title,
          style: kSubheadingtextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Text(
              notification.body,
              style: kSubheading2textStyle,
            ),
            const SizedBox(height: 4),
            Text(
              '⏰ Scheduled at: ${DateFormat('dd MMM yyyy, hh:mm a').format(notification.time.toLocal())}',
              style: kListContainerTextStyle,
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.cancel, color: Colors.redAccent),
          tooltip: "Cancel Reminder",
          onPressed: onDelete,
        ),
      ),
    );
  }
}
