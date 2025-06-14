import 'dart:math';
import 'package:flutter/material.dart';
import '../../../infrastructure/models/scheduled_notification.dart';
import '../../../infrastructure/services/notifications/notification_services.dart';
import '../../values/constants.dart';

class ScheduledNotificationsPage extends StatefulWidget {
  const ScheduledNotificationsPage({super.key});

  @override
  State<ScheduledNotificationsPage> createState() =>
      _ScheduledNotificationsPageState();
}

class _ScheduledNotificationsPageState
    extends State<ScheduledNotificationsPage> {
  late List<ScheduledNotification> _notifications;
  final Set<int> _expandedIds = {}; // tracks which cards are expanded

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
        content: Text("🎯 A notification will pop in 5 seconds..."),
      ),
    );
  }

  String _formatTime(DateTime dt) {
    final time = TimeOfDay.fromDateTime(dt);
    final date = "${dt.day}/${dt.month}/${dt.year}";
    return "$date at ${time.format(context)}";
  }

  Widget _buildNotificationCard(ScheduledNotification notif) {
    final isExpanded = _expandedIds.contains(notif.id);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (_expandedIds.contains(notif.id)) {
            _expandedIds.remove(notif.id);
          } else {
            _expandedIds.add(notif.id);
          }
        });
      },
      child: Dismissible(
        key: Key(notif.id.toString()),
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFB00020),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        onDismissed: (_) => _deleteNotification(notif.id),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF141414),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0x4D000000),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: kButtonColor.withAlpha(25),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            tileColor: Colors.transparent,
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kButtonColor.withAlpha(40),
                shape: BoxShape.circle,
              ),
              child:
                  const Icon(Icons.notifications, color: kButtonColor, size: 22),
            ),
            title: Text(
              notif.title,
              style: kHeadingextStyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                
              ),
              maxLines: isExpanded ? null : 1,
              overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
            subtitle: isExpanded
                ? Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notif.body,
                          style: kSubheadingtextStyle.copyWith(
                            color: Colors.grey[300],
                            overflow: TextOverflow.visible,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _formatTime(notif.time),
                          style: kSubheadingtextStyle.copyWith(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kAppbarTitleTextColor),
        surfaceTintColor: kBackgroundColor,
        title: const Text('My Reminders', style: kAppbarTitleStyle),
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "💡 Tap to view. Swipe left to delete a reminder",
                style: kSubheadingtextStyle.copyWith(
                  color: Colors.grey.shade400,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Quick test button
            GestureDetector(
              onTap: _scheduleQuickNotification,
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF141414),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x4D000000),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                    BoxShadow(
                      color: kButtonColor.withAlpha(25),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: kButtonColor.withAlpha(40),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.flash_on,
                          color: kButtonColor, size: 24),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Run Test Notification",
                            style: kHeadingextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Simulate a reminder to see how it works",
                            style: kSubheadingtextStyle.copyWith(
                              color: Colors.grey[400],
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 4),

            // Notifications List
            Expanded(
              child: _notifications.isEmpty
                  ? const Center(
                      child: Text("No scheduled notifications",
                          style: kH1textStyle),
                    )
                  : ListView.builder(
                      itemCount: _notifications.length,
                      itemBuilder: (_, index) =>
                          _buildNotificationCard(_notifications[index]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
