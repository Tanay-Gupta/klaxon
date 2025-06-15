import 'package:flutter/material.dart';

import '../../infrastructure/models/bounty_model.dart';
import '../values/constants.dart';

class BountyCard extends StatelessWidget {
  final BountyModel bounty;
  final int index;
  final double height;

  const BountyCard({
    super.key,
    required this.bounty,
    required this.index,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5),
      child: Card(
        clipBehavior:
            Clip.antiAlias, // Ensures the container respects the card's rounded corners
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 8.0,
        child: Stack(
          alignment:
              Alignment.bottomLeft, // Aligns the content to the bottom-left
          children: [
            // Background Image
            Container(
              // height: height , // Give the card a fixed height
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/testImages/bbg${index + 1}.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Gradient Overlay for Text Readability
            Container(
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withAlpha((0.8 * 255).toInt()),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
            ),

            // Content Overlay
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Takes minimum space
                children: [
                  // Bounty Name
                  Text(
                    bounty.name ?? 'Untitled Bounty',
                    style: kHeadingextStyle.copyWith(
                      fontSize: 20,
                      overflow: TextOverflow.visible,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Amount and Platform in a Row
                  Row(
                    children: [
                      // Amount
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade400,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          '\$${bounty.amount?.toString() ?? 'N/A'}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // Platform
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: kButtonColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          (bounty.platform ?? 'N/A'),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
