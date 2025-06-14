import 'package:flutter/material.dart';

import '../../../infrastructure/models/platform_model.dart';
import '../../../infrastructure/services/url/url_launcher_service.dart';
import '../../values/constants.dart';
import '../../values/platform_master.dart';
import 'components/body.dart';

class PlatformDetailPage extends StatelessWidget {
  final String platformName;
  final PlatformType platformType;
  const PlatformDetailPage({super.key, required this.platformName , required this.platformType});

  @override
  Widget build(BuildContext context) {
     final launcher = UrlLauncherService();
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
            tooltip: "Launch Site",
            icon: Image.asset(
              'assets/icons/visitSite.png',
              width: 50,
              height: 50,
            ),
            onPressed: () async{
              // Handle notification button press platformURLs[]
              await launcher.launchUrlInBrowser(platformURLs[platformName]??"");
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
