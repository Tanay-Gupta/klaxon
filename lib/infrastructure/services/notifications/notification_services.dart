// import 'dart:math';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   NotificationService() {
//     _initialize();
//   }

//   void requestNotificationPermission() async {
//     NotificationSettings settings = await _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: true,
//       provisional: true,
//       sound: true,
//     );
//     print('User granted permission: ${settings.authorizationStatus}');
//   }

//   Future<String> getDeviceToken() async {
//     String? token = await _firebaseMessaging.getToken();
//     return token!;
//   }

//   void isTokenRefresh() {
//     _firebaseMessaging.onTokenRefresh.listen((String token) {
//       print('Token refreshed: $token');
//     });
//   }

//   void _initialize() {
//     requestNotificationPermission();
//     _configureLocalNotification();
//     _configureFirebaseListeners();
//   }

//   void _configureLocalNotification() {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     _flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: (payload) async {
//       handleMessage(RemoteMessage(data: {'route': payload}));
//       debugPrint('Notification clicked');
//     });
//   }

//   void _configureFirebaseListeners() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       _showNotification(message);
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       // Handle notification tap when the app is in background or terminated

//       handleMessage(message);
//     });
//   }

//   Future<void> _showNotification(RemoteMessage message) async {
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       Random.secure().nextInt(1000000).toString(),
//       'Algohunt Alerts',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//     );
//     NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     await _flutterLocalNotificationsPlugin.show(
//       0,
//       message.notification?.title,
//       message.notification?.body,
//       platformChannelSpecifics,
//       payload: message.data['route'],
//     );
//   }

//   void handleMessage(RemoteMessage message) {
//     if (message.data['route'] != null) {
//       debugPrint('Notification payload: ${message.data['route']}');
//       // Handle the notification payload
//     }
//   }
// }
///------------------------------------------------------------------------------------
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_timezone/flutter_timezone.dart';

// import 'package:hive/hive.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import '../../models/scheduled_notification.dart';

// class NotificationService {
//   static final FirebaseMessaging _firebaseMessaging =
//       FirebaseMessaging.instance;
//   static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   static final Box<ScheduledNotification> _box =
//       Hive.box<ScheduledNotification>('scheduled_notifications');

//   static Future<void> initialize() async {
//     await _requestPermission();
//     await _configureLocalNotification();
//      _configureFirebaseListeners();
//     await _initializeTimeZone();
//   }

//   static Future<void> _initializeTimeZone() async {
//     tz.initializeTimeZones();
//     final String timeZoneName = await FlutterTimezone.getLocalTimezone();
//     tz.setLocalLocation(tz.getLocation(timeZoneName));
//   }

//   static Future<void> _requestPermission() async {
//     await _firebaseMessaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }

//   static Future<void> requestExactAlarmPermission() async {
//     final plugin = FlutterLocalNotificationsPlugin();
//     final isGranted =
//         await plugin
//             .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin
//             >()
//             ?.requestExactAlarmsPermission();

//     if (isGranted != true) {
//       debugPrint("Exact alarm permission not granted");
//     }
//   }

//   static Future<void> _configureLocalNotification() async {
//     const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const initSettings = InitializationSettings(android: androidInit);
//     await _localNotificationsPlugin.initialize(initSettings);
//   }

//   static void _configureFirebaseListeners() {
//     FirebaseMessaging.onMessage.listen(_showNotification);
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//   }

//   static Future<void> _showNotification(RemoteMessage message) async {
//     final androidDetails = AndroidNotificationDetails(
//       'contesthunt_channel',
//       'contestHunt Alerts',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     await _localNotificationsPlugin.show(
//       0,
//       message.notification?.title,
//       message.notification?.body,
//       NotificationDetails(android: androidDetails),
//       payload: message.data['route'],
//     );
//   }

//   static Future<void> showTestNotification() async {
//     const androidDetails = AndroidNotificationDetails(
//       'test_channel',
//       'Test Channel',
//       channelDescription: 'Channel for test notifications',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     const notificationDetails = NotificationDetails(android: androidDetails);

//     await _localNotificationsPlugin.show(
//       9999, // Unique notification ID for testing
//       'Test Notification',
//       'This is a test notification to verify local notifications are working.',
//       notificationDetails,
//       payload: 'test_payload',
//     );
//   }

//   static Future<void> scheduleCustomNotification({
//     required String title,
//     required String body,
//     required DateTime scheduledTime,
//   }) async {
//     final id = Random().nextInt(1000000);

//     await _localNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       tz.TZDateTime.from(scheduledTime, tz.local),
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           'scheduled_channel',
//           'Scheduled Notifications',
//           channelDescription: 'Notification for scheduled reminders',
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//       ),
//       androidScheduleMode:
//           AndroidScheduleMode.exactAllowWhileIdle, // or inexact
//           //uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,

//       // only if supported
//       // Fpayload: 'your_payload',
//     );

//     final notification = ScheduledNotification(
//       id: id,
//       title: title,
//       body: body,
//       time: scheduledTime,
//     );

//     await _box.put(id, notification);
//   }

//   static Future<void> cancelNotification(int id) async {
//     await _localNotificationsPlugin.cancel(id);
//     await _box.delete(id);
//   }

//   static List<ScheduledNotification> getAllScheduledNotifications() {
//     return _box.values.toList();
//   }

//   static void handleMessage(RemoteMessage message) {
//     debugPrint('Message: ${message.data}');
//   }
// }
//---------------------------

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:hive/hive.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../../models/scheduled_notification.dart'; // Assuming this path is correct

// A top-level function to handle notification taps
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // handle action
  debugPrint('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    debugPrint(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

class NotificationService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final Box<ScheduledNotification> _box =
      Hive.box<ScheduledNotification>('scheduled_notifications');

  /// Initializes notification services, including permissions, timezones, and listeners.
  static Future<void> initialize() async {
    await _initializeTimeZone();
    await _requestPermissions();
    await _configureLocalNotification();
    _configureFirebaseListeners();
    // It's good practice to request exact alarm permissions when the app starts
    // or before the user first schedules a notification.
    await requestExactAlarmPermission();
  }

  /// Initializes timezone data for scheduled notifications.
  static Future<void> _initializeTimeZone() async {
    tz.initializeTimeZones();
    try {
      final String timeZoneName = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timeZoneName));
    } catch (e) {
      debugPrint("Could not get local timezone: $e");
    }
  }

  /// Requests notification permissions for both Firebase and local notifications.
  static Future<void> _requestPermissions() async {
    // Firebase Cloud Messaging permissions
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Local notifications permissions for iOS and newer Android versions
    final plugin = _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    if (plugin != null) {
      await plugin.requestNotificationsPermission();
    }
  }

  /// Requests exact alarm permissions on Android, required for precise scheduling.
  static Future<void> requestExactAlarmPermission() async {
    final plugin = FlutterLocalNotificationsPlugin();
    final bool? isGranted = await plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestExactAlarmsPermission();

    if (isGranted == true) {
      debugPrint("Exact alarm permission granted.");
    } else {
      debugPrint("Exact alarm permission NOT granted.");
      // Here you might want to inform the user that scheduling precision will be lower.
    }
  }

  /// Configures local notification settings, channels, and tap handlers.
  static Future<void> _configureLocalNotification() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const darwinInit = DarwinInitializationSettings();
    const initSettings =
        InitializationSettings(android: androidInit, iOS: darwinInit);

    await _localNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: notificationTapBackground,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  /// Sets up listeners for incoming Firebase messages.
  static void _configureFirebaseListeners() {
    FirebaseMessaging.onMessage.listen(_showFirebaseNotification);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }

  /// Displays a notification received from Firebase.
  static Future<void> _showFirebaseNotification(RemoteMessage message) async {
    // Use a specific channel for FCM messages
    const androidDetails = AndroidNotificationDetails(
      'fcm_channel',
      'Cloud Messaging',
      channelDescription: 'Notifications from Firebase Cloud Messaging',
      importance: Importance.max,
      priority: Priority.high,
    );

    await _localNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000, // Unique ID
      message.notification?.title,
      message.notification?.body,
      const NotificationDetails(android: androidDetails),
      payload: message.data['route'], // Example payload
    );
  }

  /// Displays a test notification to verify setup.
  static Future<void> showTestNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'test_channel',
      'Test Notifications',
      channelDescription: 'Channel for test notifications',
      importance: Importance.max,
      priority: Priority.high,
    );
    const notificationDetails = NotificationDetails(android: androidDetails);

    await _localNotificationsPlugin.show(
      -1, // A fixed, unique ID for the test notification
      'Test Notification',
      'If you see this, local notifications are working!',
      notificationDetails,
      payload: 'test_payload',
    );
    debugPrint("Test notification shown.");
  }

  /// Schedules a custom local notification for a future time.
  static Future<void> scheduleCustomNotification({
    required String title,
    required String body,
    required DateTime scheduledTime,
    String payload = 'scheduled_payload',
  }) async {
    // Ensure the scheduled time is in the future.
    if (scheduledTime.isBefore(DateTime.now())) {
      debugPrint("Scheduled time $scheduledTime is in the past. Notification not scheduled.");
      return;
    }

    final id = Random().nextInt(1000000);
    const androidDetails = AndroidNotificationDetails(
      'scheduled_channel',
      'Scheduled Reminders',
      channelDescription: 'Channel for scheduled contest reminders',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    await _localNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      const NotificationDetails(android: androidDetails),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: payload,
    );

    // Save a record of the notification to Hive for persistence
    final notification = ScheduledNotification(
      id: id,
      title: title,
      body: body,
      time: scheduledTime,
    );
    await _box.put(id, notification);
    debugPrint("Notification scheduled for $scheduledTime with ID: $id");
  }

  /// Cancels a previously scheduled notification.
  static Future<void> cancelNotification(int id) async {
    await _localNotificationsPlugin.cancel(id);
    await _box.delete(id);
    debugPrint("Cancelled notification with ID: $id");
  }

  /// Retrieves all notification records from Hive.
  static List<ScheduledNotification> getAllScheduledNotifications() {
    return _box.values.toList();
  }

  /// A handler for when a user taps a notification that opened the app.
  static void handleMessage(RemoteMessage message) {
    debugPrint('Firebase onMessageOpenedApp: ${message.data}');
    // You can navigate to a specific screen based on the payload.
    // e.g., if (message.data['route'] == 'contests') { ... }
  }
}

