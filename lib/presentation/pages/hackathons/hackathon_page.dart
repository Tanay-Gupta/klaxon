import 'package:flutter/material.dart';

import '../../values/constants.dart';
import 'components/body.dart';

class HackathonPage extends StatelessWidget {
  const HackathonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: kBackgroundColor,
        title: const Text('Hackathons', style: kAppbarTitleStyle),
        centerTitle: true,
        backgroundColor: kBackgroundColor, // Match the background color
        elevation: 0,
      ),
      body: SafeArea(child: HackathonBody()),
    );
  }
}
