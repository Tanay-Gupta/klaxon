import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:hive/hive.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../../models/received_notification.dart';
import '../../models/scheduled_notification.dart'; // Assuming this path is correct

// A top-level function to handle notification taps
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // handle action
  debugPrint(
    'notification(${notificationResponse.id}) action tapped: '
    '${notificationResponse.actionId} with'
    ' payload: ${notificationResponse.payload}',
  );
  if (notificationResponse.input?.isNotEmpty ?? false) {
    debugPrint(
      'notification action tapped with input: ${notificationResponse.input}',
    );
  }
}

class NotificationService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final Box<ScheduledNotification> _box =
      Hive.box<ScheduledNotification>('scheduled_notifications');
  static final Box<ReceivedNotification> _receivedBox =
      Hive.box<ReceivedNotification>('received_notifications');

  /// Initializes notification services, including permissions, timezones, and listeners.
  static Future<void> initialize() async {
    await _initializeTimeZone();
    await _requestPermissions();
    await _configureLocalNotification();
    _configureFirebaseListeners();
    // It's good practice to request exact alarm permissions when the app starts
    // or before the user first schedules a notification.
    // await requestExactAlarmPermission();
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
    final plugin =
        _localNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();
    if (plugin != null) {
      await plugin.requestNotificationsPermission();
    }
  }

  /// Requests exact alarm permissions on Android, required for precise scheduling.
  static Future<void> requestExactAlarmPermission() async {
    final plugin = FlutterLocalNotificationsPlugin();
    final bool? isGranted =
        await plugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >()
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
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: darwinInit,
    );

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
  // static Future<void> _showFirebaseNotification(RemoteMessage message) async {
  //   // Use a specific channel for FCM messages
  //   const androidDetails = AndroidNotificationDetails(
  //     'fcm_channel',
  //     'Cloud Messaging',
  //     channelDescription: 'Notifications from Firebase Cloud Messaging',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );

  //   await _localNotificationsPlugin.show(
  //     DateTime.now().millisecondsSinceEpoch ~/ 1000, // Unique ID
  //     message.notification?.title,
  //     message.notification?.body,
  //     const NotificationDetails(android: androidDetails),
  //     payload: message.data['route'], // Example payload
  //   );
  // }
  static Future<void> _showFirebaseNotification(RemoteMessage message) async {
  const androidDetails = AndroidNotificationDetails(
    'fcm_channel',
    'Cloud Messaging',
    channelDescription: 'Notifications from Firebase Cloud Messaging',
    importance: Importance.max,
    priority: Priority.high,
  );

  final int id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  // Save to Hive
  final notif = ReceivedNotification(
    id: id,
    title: message.notification?.title ?? 'No Title',
    body: message.notification?.body ?? 'No Body',
    receivedAt: DateTime.now(),
  );
  await _receivedBox.put(id, notif);

  await _localNotificationsPlugin.show(
    id,
    notif.title,
    notif.body,
    const NotificationDetails(android: androidDetails),
    payload: message.data['route'],
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
  static Future<bool> scheduleCustomNotification({
    required String title,
    required String body,
    required DateTime scheduledTime,
    required int id,
    String payload = 'scheduled_payload',
  }) async {
    await NotificationService.requestExactAlarmPermission();
    // Ensure the scheduled time is in the future.
    if (scheduledTime.isBefore(DateTime.now())) {
      debugPrint(
        "Scheduled time $scheduledTime is in the past. Notification not scheduled.",
      );
      return false;
    }

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
    return true;
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
