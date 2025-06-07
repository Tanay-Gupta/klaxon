import 'package:flutter/material.dart';
import '../../../values/constants.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget trailing;

  const SettingTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: kSubheadingtextStyle),
                const SizedBox(height: 4),
                Text(subtitle, style: kSubheading2textStyle),
              ],
            ),
          ),
        ),
        trailing,
      ],
    );
  }
}
