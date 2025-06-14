import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../infrastructure/models/bounty_model.dart';
import '../../infrastructure/services/share/event_share.dart';
import '../values/constants.dart';
import '../values/values.dart';

class BountyListContainer extends StatelessWidget {
  final BountyModel bountyModel;
  final String imgPath;
  final bool isUpcoming;
  final VoidCallback? onShareTap;
  final VoidCallback? onContainerTap;

  const BountyListContainer({
    super.key,
    required this.bountyModel,
    required this.imgPath,
    this.isUpcoming = false,
    this.onShareTap,
    this.onContainerTap,
  });

  String _formatFullDateTime(String utc) {
    try {
      final local = DateTime.parse(utc).toLocal();
      return DateFormat('dd MMM yyyy, hh:mm a').format(local);
    } catch (_) {
      return '';
    }
  }

  String _fromEpochToIso8601(int epochSeconds) {
    return DateTime.fromMillisecondsSinceEpoch(
      epochSeconds * 1000,
    ).toIso8601String();
  }

  @override
  Widget build(BuildContext context) {
    final startFormatted = _formatFullDateTime(
      _fromEpochToIso8601(bountyModel.startTime ?? 0),
    );
    final endFormatted = _formatFullDateTime(
      _fromEpochToIso8601(bountyModel.endTime ?? 0),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0x4D000000),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: kButtonColor.withAlpha(25),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left Tapable Content
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                splashColor: kListContainerSplashColor,
                highlightColor: kListContainerHighlightColor,
                onTap: () {
                  context.push('/bountydetail', extra: bountyModel);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(imgPath, height: 40, width: 40),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              bountyModel.name ?? 'No Title',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: kHeadingextStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              isUpcoming
                                  ? 'Starts: $startFormatted'
                                  : 'Ends: $endFormatted',
                              style: kSubheadingtextStyle.copyWith(
                                color: Colors.grey[400],
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Right Share Button
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              splashColor: kListContainerSplashColor,
              highlightColor: kListContainerHighlightColor,
              onTap: () => shareBounty(bountyModel),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kButtonColor.withAlpha(40),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.share,
                  color: kButtonColor,
                  size: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
