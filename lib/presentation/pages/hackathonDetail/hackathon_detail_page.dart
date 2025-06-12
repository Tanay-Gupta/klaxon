import 'package:flutter/material.dart';
import 'package:klaxon/infrastructure/models/hackathon_model.dart';
import '../../values/constants.dart';
import 'components/body.dart';

class HackathonDetailPage extends StatelessWidget {
  final HackathonModel contest;
  const HackathonDetailPage({super.key, required this.contest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kAppbarTitleTextColor, // Set the icon color
        ),
        surfaceTintColor: kBackgroundColor,
        title: const Text('Hackathon Detail', style: kAppbarTitleStyle),
        centerTitle: true,
        backgroundColor: kBackgroundColor, // Match the background color
        elevation: 0,
      ),
      body: SafeArea(child: HackathonDetailBody(contest:contest ,)),
    );
  }
}
