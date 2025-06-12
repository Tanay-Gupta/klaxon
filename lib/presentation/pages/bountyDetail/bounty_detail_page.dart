import 'package:flutter/material.dart';
import 'package:klaxon/infrastructure/models/bounty_model.dart';
import '../../values/constants.dart';
import 'components/body.dart';

class BountyDetailPage extends StatelessWidget {
  final BountyModel contest;
  const BountyDetailPage({super.key, required this.contest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kAppbarTitleTextColor, // Set the icon color
        ),
        surfaceTintColor: kBackgroundColor,
        title: const Text('Bounty Detail', style: kAppbarTitleStyle),
        centerTitle: true,
        backgroundColor: kBackgroundColor, // Match the background color
        elevation: 0,
      ),
      body: SafeArea(child: BountyDetailBody(contest:contest ,)),
    );
  }
}
