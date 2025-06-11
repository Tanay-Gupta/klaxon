import 'package:flutter/material.dart';

import '../../../infrastructure/models/platform_model.dart';
import '../../values/constants.dart';
import 'components/body.dart';

class PlatformDetailPage extends StatelessWidget {
  final String platformName;
  final PlatformType platformType;
  const PlatformDetailPage({super.key, required this.platformName , required this.platformType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,

      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kAppbarTitleTextColor, // Set the icon color
        ),
        surfaceTintColor: kBackgroundColor,
        title: Text(platformName, style: kAppbarTitleStyle),
        centerTitle: true,
        backgroundColor: kBackgroundColor, // Match the background color
        elevation: 0,
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/icons/visitSite.png',
              width: 50,
              height: 50,
            ),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: SafeArea(
        child: PlatformDetailBody(platformName: platformName.toLowerCase(), platformType: platformType,),
      ),
    );
  }
}
