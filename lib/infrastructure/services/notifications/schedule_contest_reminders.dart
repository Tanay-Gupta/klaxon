import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

import 'notification_services.dart';

int generateContestId(String name, int startTime) {
  final input = '$name-$startTime';
  final bytes = utf8.encode(input);
  final digest = md5.convert(bytes);
  // Converting part of MD5 hash to int (4 bytes)
  return digest.bytes.sublist(0, 4).fold(0, (a, b) => a * 256 + b);
}

Future<void> scheduleContestReminders({
  required String contestName,
  required int startTimeEpoch,
}) async {
  final contestStart =
      DateTime.fromMillisecondsSinceEpoch(startTimeEpoch * 1000).toLocal();
  final contestId = generateContestId(contestName, startTimeEpoch);

  final List<_ReminderConfig> reminders = [
    _ReminderConfig(
      minutesBefore: 1440,
      idSuffix: 1,
      title: '⚔️ $contestName is Coming!',
      body: 'You’ve got 24 hours to prepare your brain 🧠 and snacks 🍫',
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
          'Grab water 💧, sit straight 🪑, and breathe — it’s almost go-time!',
    ),
  ];

  for (final reminder in reminders) {
    final scheduledTime = contestStart.subtract(
      Duration(minutes: reminder.minutesBefore),
    );
    if (scheduledTime.isAfter(DateTime.now())) {
      await NotificationService.scheduleCustomNotification(
        id: contestId * 10 + reminder.idSuffix,
        title: reminder.title,
        body: reminder.body,
        scheduledTime: scheduledTime,
      );
    }
  }
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
