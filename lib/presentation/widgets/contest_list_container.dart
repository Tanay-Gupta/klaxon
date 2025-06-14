// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:intl/intl.dart';

// import '../../infrastructure/models/contest_model.dart';
// import '../../infrastructure/services/notifications/schedule_contest_reminders.dart';
// import '../../infrastructure/services/share/event_share.dart';
// import '../values/constants.dart';
// import '../values/values.dart';

// class ContestListContainer extends StatelessWidget {
//   final ContestModel contestModel;
//   final String imgPath;
//   final bool isUpcoming;
//   final VoidCallback? onShareTap;
//   final VoidCallback? onContainerTap;
//   final int maxLines;

//   const ContestListContainer({
//     super.key,
//     required this.contestModel,
//     required this.imgPath,
//     this.isUpcoming = false,
//     this.onShareTap,
//     this.onContainerTap,
//     this.maxLines = 3,
//   });

//   String _formatFullDateTime(String utc) {
//     try {
//       final local = DateTime.parse(utc).toLocal();
//       return DateFormat('dd MMM yyyy, hh:mm a').format(local);
//     } catch (_) {
//       return '';
//     }
//   }

//   String _fromEpochToIso8601(int epochSeconds) {
//     return DateTime.fromMillisecondsSinceEpoch(
//       epochSeconds * 1000,
//     ).toIso8601String();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final startFormatted = _formatFullDateTime(
//       _fromEpochToIso8601(contestModel.startTime ?? 0),
//     );
//     final endFormatted = _formatFullDateTime(
//       _fromEpochToIso8601(contestModel.endTime ?? 0),
//     );

//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       decoration: BoxDecoration(
//         color: kListContainerBGColor,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           // Left tapable section
//           Expanded(
//             child: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 onTap: () {
//                   context.push(
//                     '/contestdetail',
//                     extra: contestModel, // pass the actual model here
//                   );
//                 },
//                 borderRadius: BorderRadius.circular(12),
//                 splashColor: kListContainerSplashColor,
//                 highlightColor: kListContainerHighlightColor,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 12,
//                     horizontal: 12,
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SvgPicture.asset(imgPath, height: 36, width: 36),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               contestModel.name ?? 'No Title',
//                               maxLines: maxLines,
//                               overflow: TextOverflow.ellipsis,
//                               style: kSubtitleTextSyle.copyWith(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 15,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             isUpcoming == false
//                                 ? Text(
//                                   'ends at: $endFormatted',
//                                   style: kListContainerTextStyle,
//                                 )
//                                 : Text(
//                                   'starts at: $startFormatted',
//                                   style: kListContainerTextStyle,
//                                 ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           // Right share button
//           Material(
//             color: Colors.transparent,
//             child: InkWell(
//               onTap: () async {
//                 if (isUpcoming) {
//                   final success = await scheduleContestReminders(
//                     startTimeEpoch: contestModel.startTime!,
//                     contestName: contestModel.name ?? 'Coding Contest',
//                   );
//                   if (success && context.mounted) {
//                     final message =
//                         kFunnyNotificationMessages[Random().nextInt(
//                           kFunnyNotificationMessages.length,
//                         )];

//                     ScaffoldMessenger.of(
//                       context,
//                     ).showSnackBar(SnackBar(content: Text(message)));
//                   }
//                 } else {
//                   shareContest(contestModel);
//                 }
//               },
//               borderRadius: BorderRadius.circular(20),
//               splashColor: kListContainerSplashColor,
//               highlightColor: kListContainerHighlightColor,
//               child: Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: Icon(
//                   isUpcoming ? Icons.notification_add : Icons.share,
//                   color: Colors.white70,
//                   size: 20,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../infrastructure/models/contest_model.dart';
import '../../infrastructure/services/notifications/schedule_contest_reminders.dart';
import '../../infrastructure/services/share/event_share.dart';
import '../values/constants.dart';
import '../values/values.dart';

class ContestListContainer extends StatelessWidget {
  final ContestModel contestModel;
  final String imgPath;
  final bool isUpcoming;
  final VoidCallback? onShareTap;
  final VoidCallback? onContainerTap;
  final int maxLines;

  const ContestListContainer({
    super.key,
    required this.contestModel,
    required this.imgPath,
    this.isUpcoming = false,
    this.onShareTap,
    this.onContainerTap,
    this.maxLines = 3,
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
      _fromEpochToIso8601(contestModel.startTime ?? 0),
    );
    final endFormatted = _formatFullDateTime(
      _fromEpochToIso8601(contestModel.endTime ?? 0),
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
          // Left section (tapable card)
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                splashColor: kListContainerSplashColor,
                highlightColor: kListContainerHighlightColor,
                onTap: () {
                  context.push('/contestdetail', extra: contestModel);
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
                              contestModel.name ?? 'No Title',
                              maxLines: maxLines,
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

          // Right icon (notify/share)
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              splashColor: kListContainerSplashColor,
              highlightColor: kListContainerHighlightColor,
              onTap: () async {
                if (isUpcoming) {
                  final success = await scheduleContestReminders(
                    startTimeEpoch: contestModel.startTime!,
                    contestName: contestModel.name ?? 'Coding Contest',
                  );
                  if (success && context.mounted) {
                    final message = kFunnyNotificationMessages[
                        Random().nextInt(kFunnyNotificationMessages.length)];
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );
                  }
                } else {
                  shareContest(contestModel);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kButtonColor.withAlpha(40),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isUpcoming ? Icons.notifications_active : Icons.share,
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
