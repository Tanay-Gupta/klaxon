import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../values/constants.dart';

class ListContainer extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String imgUrl;
  final String contestUrl;
  final String? title;
  final bool isUpcoming;
  final VoidCallback? onShareTap;
  final VoidCallback? onContainerTap;

  const ListContainer({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.imgUrl,
    required this.contestUrl,
    this.title,
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

  @override
  Widget build(BuildContext context) {
    final startFormatted = _formatFullDateTime(startTime);
    final endFormatted = _formatFullDateTime(endTime);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xff110919),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Left tapable section
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onContainerTap,
                borderRadius: BorderRadius.circular(12),
                splashColor: Colors.white24,
                highlightColor: Colors.white10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(imgUrl, height: 36, width: 36),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title ?? 'No Title',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kSubtitleTextSyle.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 4),
                            isUpcoming
                                ? Text(
                                  'Ends at:   $endFormatted',
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 13,
                                  ),
                                )
                                : Text(
                                  'Starts at: $startFormatted',
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
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

          // Right share button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onShareTap,
              borderRadius: BorderRadius.circular(20),
              splashColor: Colors.white24,
              highlightColor: Colors.white10,
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Icon(Icons.share, color: Colors.white70, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
