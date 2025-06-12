import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

import 'notification_services.dart';

int generateSafeContestId(String name, int startTime) {
  final input = '$name-$startTime';
  final bytes = utf8.encode(input);
  final digest = md5.convert(bytes);
  // Only use last 3 bytes for compactness (24-bit = max 16,777,215)
  final int hash =
      (digest.bytes[13] << 16) | (digest.bytes[14] << 8) | (digest.bytes[15]);
  return hash;
}

Future<bool> scheduleContestReminders({
  required String contestName,
  required int startTimeEpoch,
}) async {
  final contestStart =
      DateTime.fromMillisecondsSinceEpoch(startTimeEpoch * 1000).toLocal();
  final contestId = generateSafeContestId(contestName, startTimeEpoch);

  final List<_ReminderConfig> reminders = [
    _ReminderConfig(
      minutesBefore: 1440,
      idSuffix: 1,
      title: '⚔️ $contestName is Coming!',
      body: 'You\'ve got 24 hours to prepare your brain 🧠 and snacks 🍫',
    ),
    _ReminderConfig(
      minutesBefore: 60,
      idSuffix: 2,
      title: '⏳ 1 Hour to $contestName!',
      body: 'Warm up those fingers! ⌨️ One hour till code battle begins 🧑‍💻',
    ),
    _ReminderConfig(
      minutesBefore: 15,
      idSuffix: 3,
      title: '🧨 15 Mins Left!',
      body: 'Last chance to Google "How to be a 6-star coder in 10 minutes" 😅',
    ),
    _ReminderConfig(
      minutesBefore: 5,
      idSuffix: 4,
      title: '🚨 $contestName in 5 mins!',
      body:
          'Grab water 💧, sit straight 🪑, and breathe — it\'s almost go-time!',
    ),
  ];

  bool scheduledAny = false;

  for (final reminder in reminders) {
    final scheduledTime = contestStart.subtract(
      Duration(minutes: reminder.minutesBefore),
    );

    final success = await NotificationService.scheduleCustomNotification(
      id: contestId * 10 + reminder.idSuffix,
      title: reminder.title,
      body: reminder.body,
      scheduledTime: scheduledTime,
    );

    if (success) scheduledAny = true;
  }

  return scheduledAny;
}

class _ReminderConfig {
  final int minutesBefore;
  final int idSuffix; // Unique suffix for the reminder type
  final String title;
  final String body;

  _ReminderConfig({
    required this.minutesBefore,
    required this.idSuffix,
    required this.title,
    required this.body,
  });
}
