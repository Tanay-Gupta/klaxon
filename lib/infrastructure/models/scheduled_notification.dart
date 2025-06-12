import 'package:hive/hive.dart';

part 'scheduled_notification.g.dart';

@HiveType(typeId: 0)
class ScheduledNotification extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String body;

  @HiveField(3)
  final DateTime time;

  ScheduledNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.time,
  });
}
