import 'package:flutter/material.dart';

import '../values/constants.dart';

// 🟢 Reusable Event Action Button
class EventActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const EventActionButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: kButtonColor,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      child: Text(label, style: kSubheadingtextStyle),
    );
  }
}
