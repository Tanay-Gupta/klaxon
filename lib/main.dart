import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:klaxon/infrastructure/models/scheduled_notification.dart';
import 'package:path_provider/path_provider.dart';
import 'app.dart';
import 'firebase_options.dart';
import 'infrastructure/models/received_notification.dart';
import 'infrastructure/services/notifications/notification_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(ScheduledNotificationAdapter());
  await Hive.openBox<ScheduledNotification>('scheduled_notifications');
  Hive.registerAdapter(ReceivedNotificationAdapter());
  await Hive.openBox<ReceivedNotification>('received_notifications');

  // notificationService.getDeviceToken().then((value) {
  //   print('Device Token: $value');
  // });
  await NotificationService.initialize();

  runApp(MyApp());
}

// Lisitnening to the background messages
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}
