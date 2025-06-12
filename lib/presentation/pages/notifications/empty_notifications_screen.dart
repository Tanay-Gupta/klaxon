import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../values/constants.dart';
import '../../values/values.dart';
import '../../widgets/event_action_button.dart';

class EmptyNotificationsScreen extends StatelessWidget {
  const EmptyNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kAppbarTitleTextColor, // Set the icon color
        ),
        surfaceTintColor: kBackgroundColor,
        title: const Text(notificationsTitle, style: kAppbarTitleStyle),
        centerTitle: true,
        backgroundColor: kBackgroundColor, // Match the background color
        elevation: 0,
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.asset(
                    noNotificationIllistration,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              const Spacer(flex: 2),

              ErrorInfo(
                title: "Empty Notifications",
                description:
                    "It looks like you don't have any notifications right now. We'll let you know when there's something new.",
                // button: you can pass your custom button,
                btnText: "Check again",
                press: () {},
              ),

              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorInfo extends StatelessWidget {
  const ErrorInfo({
    super.key,
    required this.title,
    required this.description,
    this.button,
    this.btnText,
    required this.press,
  });

  final String title;
  final String description;
  final Widget? button;
  final String? btnText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: kH1textStyle,
            ),
            const SizedBox(height: 16),
            Text(description, textAlign: TextAlign.center, style: kH1SubHeadingtextStyle.copyWith(overflow: TextOverflow.visible),),
            const SizedBox(height: 16 * 2.5),
            button ??
                ElevatedButton(
                  onPressed: press,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    backgroundColor:kSegmentedTabSelectedColor,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: Text(btnText ?? "Retry".toUpperCase(),style: kSubheadingtextStyle,),
                ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
