import 'package:flutter/material.dart';
import 'package:klaxon/presentation/pages/contests/components/body.dart';

import '../../values/constants.dart';

class ContestPage extends StatelessWidget {
  const ContestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: kBackgroundColor,
        title: const Text('Contests', style: kAppbarTitleStyle),
        centerTitle: true,
        backgroundColor: kBackgroundColor, // Match the background color
        elevation: 0,
      ),
      body: SafeArea(child: ContestBody()),
    );
  }
}


