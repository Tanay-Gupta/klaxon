import 'package:flutter/material.dart';
import 'package:klaxon/presentation/values/dummy_data.dart';

import '../../../infrastructure/models/contest_model.dart';
import '../../values/constants.dart';
import 'components/body.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
   Map<String, Object>  data={
    "created_at": "2025-01-21T13:22:55.415006+00:00",
    "description": "Bhai koi description nahi hai",
    "duration": 6000,
    "end_time": 1737825000,
    "id": 35,
    "name": "AtCoder Beginner Contest 390",
    "platform": "atcoder",
    "start_time": 1737819000,
    "url": "https://atcoder.jp/contests/abc390"
  };
    ContestModel contest = ContestModel.fromJson(data); ;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kAppbarTitleTextColor, // Set the icon color
        ),
        surfaceTintColor: kBackgroundColor,
        title: const Text('Event Detail', style: kAppbarTitleStyle),
        centerTitle: true,
        backgroundColor: kBackgroundColor, // Match the background color
        elevation: 0,
      ),
      body: SafeArea(child: EventDetailBody(contest:contest ,)),
    );
  }
}
