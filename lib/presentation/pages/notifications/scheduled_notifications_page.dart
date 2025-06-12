// scheduled_notifications_page.dart
import 'package:flutter/material.dart';
import '../../../infrastructure/models/scheduled_notification.dart';
import '../../../infrastructure/services/notifications/notification_services.dart';
import 'dart:math';

import '../../values/constants.dart';
import 'components/notification_card.dart';

class ScheduledNotificationsPage extends StatefulWidget {
  const ScheduledNotificationsPage({super.key});

  @override
  State<ScheduledNotificationsPage> createState() =>
      _ScheduledNotificationsPageState();
}

class _ScheduledNotificationsPageState
    extends State<ScheduledNotificationsPage> {
  late List<ScheduledNotification> _notifications;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    final list = NotificationService.getAllScheduledNotifications();
    list.removeWhere((n) => n.time.isBefore(DateTime.now()));
    setState(() => _notifications = list);
  }

  Future<void> _deleteNotification(int id) async {
    await NotificationService.cancelNotification(id);
    await _loadNotifications();
  }

  Future<void> _scheduleQuickNotification() async {
    final scheduled = DateTime.now().add(const Duration(seconds: 5));

    await NotificationService.scheduleCustomNotification(
      id: Random().nextInt(1000000),
      title: '⚡ Surprise Incoming!',
      body: 'Boom! A wild notification appears in 5 seconds 👀',
      scheduledTime: scheduled,
    );

    await _loadNotifications();

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "🎯 Heads up! A notification is sneaking up in 5 seconds...",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kAppbarTitleTextColor, // Set the icon color
        ),
        surfaceTintColor: kBackgroundColor,
        title: const Text('My Reminders', style: kAppbarTitleStyle),
        centerTitle: true,
        backgroundColor: kBackgroundColor, // Match the background color
        elevation: 0,
      ),
      body:
          _notifications.isEmpty
              ? const Center(
                child: Text("No scheduled notifications", style: kH1textStyle),
              )
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: _notifications.length,
                  itemBuilder: (_, index) {
                    final n = _notifications[index];
                    return NotificationCard(
                      notification: n,
                      onDelete: () => _deleteNotification(n.id),
                    );
                  },
                ),
              ),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        child: Icon(Icons.notifications),
        onPressed: _scheduleQuickNotification,
      ),
    );
  }
}
