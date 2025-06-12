import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:klaxon/infrastructure/models/hackathon_model.dart';
import '../values/constants.dart';

class HackathonListContainer extends StatelessWidget {
  final HackathonModel hackathonModel;
  final String imgPath;
  final bool isUpcoming;
  final VoidCallback? onShareTap;
  final VoidCallback? onContainerTap;

  const HackathonListContainer({
    super.key,
    required this.hackathonModel,
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
      _fromEpochToIso8601(hackathonModel.startTime ?? 0),
    );
    final endFormatted = _formatFullDateTime(
      _fromEpochToIso8601(hackathonModel.endTime ?? 0),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: kListContainerBGColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Left tapable section
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  context.push(
                    '/hackathondetail',
                    extra: hackathonModel, // pass the actual model here
                  );
                },
                borderRadius: BorderRadius.circular(12),
                splashColor: kListContainerSplashColor,
                highlightColor: kListContainerHighlightColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(imgPath, height: 36, width: 36),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hackathonModel.name ?? 'No Title',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: kSubtitleTextSyle.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 4),
                            isUpcoming == false
                                ? Text(
                                  'ends at: $endFormatted',
                                  style: kListContainerTextStyle,
                                )
                                : Text(
                                  'starts at: $startFormatted',
                                  style: kListContainerTextStyle,
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

          // Right share button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onShareTap,
              borderRadius: BorderRadius.circular(20),
              splashColor: kListContainerSplashColor,
              highlightColor: kListContainerHighlightColor,
              child:  Padding(
                padding: EdgeInsets.all(12),
                child: Icon( isUpcoming ? Icons.notification_add : Icons.share, color: Colors.white70, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
