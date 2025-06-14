import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../infrastructure/models/received_notification.dart';

import '../../values/constants.dart';
import '../../values/values.dart';

class NotificationCenterScreen extends StatefulWidget {
  const NotificationCenterScreen({super.key});

  @override
  State<NotificationCenterScreen> createState() =>
      _NotificationCenterScreenState();
}

class _NotificationCenterScreenState extends State<NotificationCenterScreen> {
  late Box<ReceivedNotification> _notifBox;

  @override
  void initState() {
    super.initState();
    _notifBox = Hive.box<ReceivedNotification>('received_notifications');
  }

  void _deleteNotification(int key) {
    _notifBox.delete(key);
  }

  void _clearAllNotifications() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Clear All Notifications?'),
            content: const Text(
              'Are you sure you want to delete all notifications?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Delete All'),
              ),
            ],
          ),
    );

    if (confirm == true) {
      await _notifBox.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kAppbarTitleTextColor),
        surfaceTintColor: kBackgroundColor,
        backgroundColor: kBackgroundColor,
        title: const Text(notificationsTitle, style: kAppbarTitleStyle),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: _notifBox.isEmpty ? null : _clearAllNotifications,
          ),
        ],
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: _notifBox.listenable(),
          builder: (context, Box<ReceivedNotification> box, _) {
            if (box.isEmpty) {
              return _buildEmptyNotifications(context);
            }

            final notifs = box.values.toList().reversed.toList();

            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              itemCount: notifs.length + 1, // +1 for top instruction message
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Center(
                      child: Text(
                        "⬅️  Swipe left to delete a notification",
                        style: kSubheadingtextStyle.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                }

                final notif = notifs[index - 1];
                return Dismissible(
                  key: Key(notif.id.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    decoration: BoxDecoration(
                      color: Colors.red.withAlpha(
                        (255 * 0.8).toInt(),
                      ), // 0.8 opacity = 204

                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (_) => _deleteNotification(notif.id),
                  child: InkWell(
                    onTap: () => _showNotificationDetail(context, notif),
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      // margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF141414),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(
                              (255 * 0.3).toInt(),
                            ), // 0.3 opacity = 76.5 ≈ 77

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
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        tileColor: Colors.transparent,
                        trailing: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: kButtonColor.withAlpha(51), // 20% opacity
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.notifications,
                            color: kButtonColor,
                            size: 20,
                          ),
                        ),
                        title: Text(
                          notif.title,
                          style: kHeadingextStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notif.body,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: kSubheadingtextStyle.copyWith(
                                  fontSize: 14,
                                  color: Colors.grey[300],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                _formatTime(notif.receivedAt),
                                style: kSubheadingtextStyle.copyWith(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyNotifications(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Spacer(flex: 2),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: AspectRatio(
              aspectRatio: 1,
              child: SvgPicture.asset(
                noNotificationIllistration,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          const Spacer(flex: 2),
          ErrorInfo(
            title: "Empty Notifications",
            description:
                "It looks like you don't have any notifications right now. We'll let you know when there's something new.",
            btnText: "Check again",
            press: () {
              setState(() {});
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  void _showNotificationDetail(
    BuildContext context,
    ReceivedNotification notif,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF141414),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (_) => Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notif.title,
                  style: kHeadingextStyle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.visible,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  notif.body,
                  style: kSubheadingtextStyle.copyWith(
                    color: Colors.grey[300],
                    overflow: TextOverflow.visible,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Received at: ${_formatTime(notif.receivedAt)}",
                  style: kSubheadingtextStyle.copyWith(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    if (now.difference(time).inDays == 0) {
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    } else {
      return '${time.day}/${time.month} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    }
  }
}

class ErrorInfo extends StatelessWidget {
  const ErrorInfo({
    super.key,
    required this.title,
    required this.description,
    this.button,
    this.btnText,
    required this.press,
  });

  final String title;
  final String description;
  final Widget? button;
  final String? btnText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: kH1textStyle),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: kH1SubHeadingtextStyle.copyWith(
                overflow: TextOverflow.visible,
              ),
            ),
            const SizedBox(height: 40),
            button ??
                ElevatedButton(
                  onPressed: press,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    backgroundColor: kSegmentedTabSelectedColor,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: Text(
                    btnText ?? "Retry".toUpperCase(),
                    style: kSubheadingtextStyle,
                  ),
                ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
