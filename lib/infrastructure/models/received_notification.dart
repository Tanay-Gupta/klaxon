import 'package:hive/hive.dart';

part 'received_notification.g.dart';

@HiveType(typeId: 1)
class ReceivedNotification extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String body;

  @HiveField(3)
  final DateTime receivedAt;

  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.receivedAt,
  });
}
