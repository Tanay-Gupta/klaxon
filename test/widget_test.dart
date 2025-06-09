// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:klaxon/infrastructure/models/contest_model.dart';

void main() {
  final contest = ContestModel.fromJson({
    "created_at": "2023-06-09T12:00:00Z",
    "description": "Test Contest",
    "duration": 3600,
    "end_time": 1623153600,
    "id": 123,
    "name": "June Challenge",
    "platform": "Codeforces",
    "start_time": 1623150000,
    "url": "https://example.com",
  });

  print(contest);
}
