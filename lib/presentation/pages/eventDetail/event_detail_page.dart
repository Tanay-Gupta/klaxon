import 'package:flutter/material.dart';
import '../../../infrastructure/models/contest_model.dart';
import '../../values/constants.dart';
import 'components/body.dart';

class EventDetailPage extends StatelessWidget {
  final ContestModel contest;
  const EventDetailPage({super.key, required this.contest});

  @override
  Widget build(BuildContext context) {
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
