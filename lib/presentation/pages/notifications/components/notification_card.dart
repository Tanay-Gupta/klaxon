import 'package:flutter/material.dart';
import '../../../../infrastructure/models/scheduled_notification.dart';

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
    return Card(
      child: ListTile(
        title: Text(notification.title),
        subtitle: Text(
          '${notification.body}\nScheduled at: ${notification.time.toLocal()}',
          style: const TextStyle(fontSize: 12),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.cancel, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
