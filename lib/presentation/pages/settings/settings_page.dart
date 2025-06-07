import 'package:flutter/material.dart';
import 'package:klaxon/presentation/pages/settings/components/body.dart';
import '../../values/constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: kBackgroundColor,
        title: const Text('Settings', style: kAppbarTitleStyle),
        centerTitle: true,
        backgroundColor: kBackgroundColor, // Match the background color
        elevation: 0,
      ),
      body: const SafeArea(child: SettingsBody()),
    );
  }
}
