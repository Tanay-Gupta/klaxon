import 'package:flutter/material.dart';

import '../../../infrastructure/models/scheduled_notification.dart';
import '../../../infrastructure/services/notifications/notification_services.dart';

class ScheduledNotificationsPage extends StatefulWidget {
  const ScheduledNotificationsPage({super.key});

  @override
  State<ScheduledNotificationsPage> createState() =>
      _ScheduledNotificationsPageState();
}

class _ScheduledNotificationsPageState
    extends State<ScheduledNotificationsPage> {
  late List<ScheduledNotification> notifications;

  @override
  void initState() {
    super.initState();
    notifications = NotificationService.getAllScheduledNotifications();
  }

  void _refreshList() {
    setState(() {
      notifications = NotificationService.getAllScheduledNotifications();
    });
  }

  Future<void> _deleteNotification(int id) async {
    await NotificationService.cancelNotification(id);
    _refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scheduled Notifications')),
      body:
          notifications.isEmpty
              ? const Center(child: Text("No scheduled notifications"))
              : ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (_, index) {
                  final n = notifications[index];
                  return Card(
                    child: ListTile(
                      title: Text(n.title),
                      subtitle: Text(
                        '${n.body}\nScheduled at: ${n.time.toLocal()}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel, color: Colors.red),
                        onPressed: () => _deleteNotification(n.id),
                      ),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final now = DateTime.now();
          //final scheduled = now.add(const Duration(minutes: 1));

          //final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

          await NotificationService.requestExactAlarmPermission();
          // await NotificationService.scheduleCustomNotification(
          //   // id: id,
          //   title: 'Demo Alert',
          //   body: 'This notification was scheduled 1 minute ago.',
          //   scheduledTime: scheduled,
          // );

          // print(
          //   'Scheduling notification at $scheduled (now: ${DateTime.now()})',
          // );
          // await NotificationService.scheduleCustomNotification(
          //   title: 'Demo Alert',
          //   body: 'This notification was scheduled 30 seconds ago.',
          //   scheduledTime: scheduled,
          // );
          final scheduled = DateTime.now().add(Duration(seconds: 5));
          await NotificationService.scheduleCustomNotification(
            title: 'Immediate Test',
            body: 'Should appear in 5 seconds',
            scheduledTime: scheduled,
          );

          _refreshList();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Notification scheduled in 1 min")),
          );
          print('Scheduled!');

          // await NotificationService.showTestNotification();
        },
      ),
    );
  }
}
