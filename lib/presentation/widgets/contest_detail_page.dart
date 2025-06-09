import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ContestDetailPage extends StatelessWidget {
  final Map<String, dynamic> contest = {
    "id": 29,
    "name": "Weekly Contest 434",
    "platform": "leetcode",
    "url": "https://leetcode.com/contest/weekly-contest-434",
    "start_time": 1737858600,
    "end_time": 1737864000,
    "duration": 5400,
    "created_at": "2025-01-21T13:04:02.888352+00:00",
    "descriptionHtml":
        ""
        "\u003Cstyle\u003E\r\n.contest-information ol:not(.list-group) {\r\n    padding-left: 20px;\r\n}\r\n.contest-information ul:not(.list-group) {\r\n    padding-left: 20px;\r\n}\r\n.contest-information li:not(.list-group-item) {\r\n    margin-top: 5px;\r\n}\r\n\r\n.contest-information .list-group .list-group-item {\r\n    border: none;\r\n    margin-bottom: 1px;\r\n}\r\n.contest-information img[alt=\"LeetCoin\"] {\r\n    position: relative;\r\n    top: -2px;\r\n}\r\n\u003C/style\u003E\r\n\r\n\u003Cdiv class=\"contest-information container\"\u003E\r\n    \u003Cdiv class=\"row\"\u003E\r\n        \u003Cdiv class=\"col-sm-8 col-md-9\"\u003E\r\n            \u003Ch3 class=\"text-300\"\u003E\r\n                Welcome to the 434th LeetCode Weekly Contest\r\n            \u003C/h3\u003E\r\n            \u003Cbr\u003E\r\n\r\n\t\t\t\t\t\t\u003Cp\u003EThis LeetCode contest is sponsored by LeetCode.\u003C/p\u003E\r\n\r\n\r\n\t\t\t\t\t\t\u003Cp\u003E\u003Cb\u003E\u003Cstrong\u003E⭐ Bonus Prizes⭐\u003C/strong\u003E\u003C/b\u003E\u003C/p\u003E\r\n\u003Cul\u003E\r\n  \u003Cli\u003EContestants ranked \u003Cstrong\u003E1st ~ 3rd\u003C/strong\u003E will win a LeetCode Backpack\u003C/li\u003E\r\n  \u003Cli\u003EContestants ranked \u003Cstrong\u003E4th ~ 10 th\u003C/strong\u003E will win a LeetCode Water Bottle \u003C/li\u003E\r\n  \u003Cli\u003EContestants ranked \u003Cstrong\u003E11th ~ 16th\u003C/strong\u003E will win a LeetCode Big O Notebook\u003C/li\u003E\r\n\u003C/ul\u003E\r\n\r\n\t\t\t\t\t\t\u003Cp\u003EOnly LCUS(leetcode.com) accounts are eligible for the bonus rewards. After the ranking is finalized, a LeetCode team member will reach out to you through email regarding the gift! \u003C/p\u003E\r\n\r\n                \u003Cimg style=\"max-width: 100%; margin-bottom: 20px\" src=\"https://assets.leetcode.com/static_assets/others/Contest_Prize_Banner.png\" /\u003E\r\n\r\n            \u003Ch4 class=\"text-300\"\u003E\r\n                \u003Ci class=\"fa fa-newspaper-o\" style=\"color: #1DA09C\" aria-hidden=\"true\"\u003E\u003C/i\u003E\r\n                &nbsp;Important Note\r\n            \u003C/h4\u003E\r\n            \u003Col\u003E\r\n                \u003Cli\u003E\r\n                  To provide a better contest and ensure fairness, we listened to LeetCoders' feedback and put in lots of thoughts behind the updated contest rule. Please check out our new contest \u003Ca href=\"https://leetcode.com/discuss/general-discussion/951105/new-contest-rule-effective-from-december-2020\"\u003Erule\u003C/a\u003E which covers more scenarios with details explained.\r\n                \u003C/li\u003E\r\n                \u003Cli\u003E\r\n                    The penalty time of \u003Cb\u003E5\u003C/b\u003E minutes will be applied for each wrong submission.\r\n                \u003C/li\u003E\r\n                \u003Cli\u003E\r\n                  To ensure the fairness of the contest, LeetCode will hide some test cases during the contest. When users submit incorrect submissions, LeetCode will not show the hidden test cases to the users.\r\n                \u003C/li\u003E\r\n                \u003Cli\u003E\r\n                  The final rating of this contest will be updated within 5 working days after the contest.\r\n                \u003C/li\u003E\r\n      \u003Cbr /\u003E \u003Cb\u003EBelow actions are deemed contest violations\u003C/b\u003E:\r\n      \u003Cul\u003E\r\n       \u003Cli\u003EOne user submitting with multiple accounts during a contest. LCUS (leetcode.com) account and LCCN (leetcode-cn.com) account are considered to be separate accounts, even if both accounts belong to the same user.\u003C/li\u003E\r\n       \u003Cli\u003EMultiple accounts submitting similar code for the same problem.\u003C/li\u003E\r\n       \u003Cli\u003ECreating unwanted disturbances which interrupt other users' participation in a contest. \u003C/li\u003E \r\n       \u003Cli\u003EDisclosing contest solutions in public discuss posts before the end of a contest. \u003C/li\u003E \r\n       \u003Cli\u003EThe use of code generation tools or any external assistance for solving problems is strictly prohibited. This includes, but is not limited to, actions such as inputting problem statements, test cases, or solution code into external assistance tools. \u003C/li\u003E \r\n\r\n      \u003C/ul\u003E\r\n      \u003Cbr /\u003E LeetCode heavily emphasizes on the justice and fairness of our contests. We have absolutely \u003Cb\u003EZERO TOLERANCE\u003C/b\u003E for violation behaviors (such as plagiarism, cheating, etc). When a user is deemed violating contest rules, we will apply the following penalties on this user:\r\n      \u003Cul\u003E\r\n       \u003Cli\u003E\u003Cb\u003EFirst violation\u003C/b\u003E: Contest score resets to zero, LeetCoin amount resets to zero and a contest and discuss ban for 1 month.\u003C/li\u003E\r\n       \u003Cli\u003E\u003Cb\u003ESecond violation\u003C/b\u003E: Contest score resets to zero and permanent account deactivation without appeal. \u003C/li\u003E\r\n      \u003C/ul\u003E\r\n      \u003Cbr /\u003E Furthermore, we encourage all participants to contribute to maintaining the justice and fairness of our contest. Users who submit valid violation report(s) will earn additional LeetCoins:\r\n      \u003Cul\u003E\r\n       \u003Cli\u003EFor each violating participant, the first 10 users who submit the violation report towards this participant will each earn 20 LeetCoins. \u003C/li\u003E\r\n       \u003Cli\u003EEach user can earn up to 100 LeetCoins for reporting violations in a contest.\u003C/li\u003E\r\n       \u003Cli\u003EUsers will not be rewarded LeetCoins for reports on LCCN users.\u003C/li\u003E\r\n      \u003C/ul\u003E\r\n     \u003C/ol\u003E\r\n            \u003Cbr\u003E\u003Cbr\u003E\r\n\u003Ch4 class=\"text-300\"\u003E\r\n    \u003Ci class=\"fa fa-bullhorn\" style=\"color: #FEA116\" aria-hidden=\"true\"\u003E\u003C/i\u003E\r\n    &nbsp;Announcement\r\n\u003C/h4\u003E\r\n            \u003Cp\u003E\r\n                Users \u003Cb class=\"text-orange\"\u003Emust register\u003C/b\u003E to participate. We hope you enjoy this contest!\r\n            \u003C/p\u003E\r\n            \u003Cbr\u003E\r\n\u003Cp\u003E\r\n\r\n        \u003C/div\u003E\r\n        \u003Cdiv class=\"col-sm-4 col-md-3\"\u003E\r\n            \u003Ch3 class=\"text-300\"\u003E\r\n                \u003Ci class=\"fa fa-trophy text-orange\" aria-hidden=\"true\"\u003E\u003C/i\u003E\r\n                &nbsp;Prize\r\n            \u003C/h3\u003E\r\n            \u003Cul class=\"list-group\" style=\"margin-top: 20px\"\u003E\r\n                \u003Cli class=\"list-group-item\"\u003E\r\n                    \u003Cb\u003E1st\u003C/b\u003E\r\n                    \u003Cspan class=\"pull-right\"\u003E\r\n                        5,000 \u003Ca href=\"/points/\" target=\"_blank\"\u003E\u003Cimg src=\"/static/images/LeetCoin.png\" height=\"15px\" alt=\"LeetCoin\"\u003E\u003C/a\u003E\r\n                    \u003C/span\u003E\r\n                \u003C/li\u003E\r\n                \u003Cli class=\"list-group-item\"\u003E\r\n                    \u003Cb\u003E2nd\u003C/b\u003E\r\n                    \u003Cspan class=\"pull-right\"\u003E\r\n                        2,500 \u003Ca href=\"/points/\" target=\"_blank\"\u003E\u003Cimg src=\"/static/images/LeetCoin.png\" height=\"15px\" alt=\"LeetCoin\"\u003E\u003C/a\u003E\r\n                    \u003C/span\u003E\r\n                \u003C/li\u003E\r\n                \u003Cli class=\"list-group-item\"\u003E\r\n                    \u003Cb\u003E3rd\u003C/b\u003E\r\n                    \u003Cspan class=\"pull-right\"\u003E\r\n                        1,000 \u003Ca href=\"/points/\" target=\"_blank\"\u003E\u003Cimg src=\"/static/images/LeetCoin.png\" height=\"15px\" alt=\"LeetCoin\"\u003E\u003C/a\u003E\r\n                    \u003C/span\u003E\r\n                \u003C/li\u003E\r\n                \u003Cli class=\"list-group-item\"\u003E\r\n                    \u003Cb\u003E4\u003C/b\u003E - \u003Cb\u003E50th\u003C/b\u003E\r\n                    \u003Cspan class=\"pull-right\"\u003E\r\n                        300 \u003Ca href=\"/points/\" target=\"_blank\"\u003E\u003Cimg src=\"/static/images/LeetCoin.png\" height=\"15px\" alt=\"LeetCoin\"\u003E\u003C/a\u003E\r\n                    \u003C/span\u003E\r\n                \u003C/li\u003E\r\n                \u003Cli class=\"list-group-item\"\u003E\r\n                    \u003Cb\u003E51\u003C/b\u003E - \u003Cb\u003E100th\u003C/b\u003E\r\n                    \u003Cspan class=\"pull-right\"\u003E\r\n                        100 \u003Ca href=\"/points/\" target=\"_blank\"\u003E\u003Cimg src=\"/static/images/LeetCoin.png\" height=\"15px\" alt=\"LeetCoin\"\u003E\u003C/a\u003E\r\n                    \u003C/span\u003E\r\n                \u003C/li\u003E\r\n                \u003Cli class=\"list-group-item\"\u003E\r\n                    \u003Cb\u003E101\u003C/b\u003E - \u003Cb\u003E200th\u003C/b\u003E\r\n                    \u003Cspan class=\"pull-right\"\u003E\r\n                        50 \u003Ca href=\"/points/\" target=\"_blank\"\u003E\u003Cimg src=\"/static/images/LeetCoin.png\" height=\"15px\" alt=\"LeetCoin\"\u003E\u003C/a\u003E\r\n                    \u003C/span\u003E\r\n                \u003C/li\u003E\r\n                \u003Cli class=\"list-group-item\"\u003E\r\n                    \u003Cb\u003EParticipate\u003C/b\u003E\r\n                    \u003Cspan class=\"pull-right\"\u003E\r\n                        5 \u003Ca href=\"/points/\" target=\"_blank\"\u003E\u003Cimg src=\"/static/images/LeetCoin.png\" height=\"15px\" alt=\"LeetCoin\"\u003E\u003C/a\u003E\r\n                    \u003C/span\u003E\r\n                \u003C/li\u003E\r\n                \u003Cli class=\"list-group-item\"\u003E\r\n                    \u003Cb\u003EFirst Time Participant\u003C/b\u003E\r\n                    \u003Cspan class=\"pull-right\"\u003E\r\n                        200 \u003Ca href=\"/points/\" target=\"_blank\"\u003E\u003Cimg src=\"/static/images/LeetCoin.png\" height=\"15px\" alt=\"LeetCoin\"\u003E\u003C/a\u003E\r\n                    \u003C/span\u003E\r\n                \u003C/li\u003E\r\n                \u003Cli class=\"list-group-item\"\u003E\r\n\u003Cspan style=\"\r\n    position: absolute;\r\n    color: rgb(245, 0, 87);\r\n    font-size: 10px;\r\n    transform: translate(-8px, -9px);\r\n\"\u003E\u003C/span\u003E\r\n                    \u003Cb\u003EParticipate Biweekly + Weekly Contests in Same Week\u003C/b\u003E\r\n                    \u003Cspan class=\"pull-right\"\u003E\r\n                        35 \u003Ca href=\"/points/\" target=\"_blank\"\u003E\u003Cimg src=\"/static/images/LeetCoin.png\" height=\"15px\" alt=\"LeetCoin\"\u003E\u003C/a\u003E\r\n                    \u003C/span\u003E\r\n                \u003C/li\u003E\r\n            \u003C/ul\u003E\r\n        \u003C/div\u003E\r\n   \u003C/div\u003E\r\n\u003C/div\u003E\r\n\u003Chr\u003E\r\n\u003Cp\u003E\u003Cb\u003EWant millions of LeetCode users to \u003Ci\u003Erecognize your company\u003C/i\u003E? \u003Ca href=\"mailto:contest@leetcode.com\" target=\"_href\"\u003EContact us\u003C/a\u003E to sponsor a contest.\u003C/b\u003E\u003C/p\u003E"
        "",
  };

  // const ContestDetailPage({super.key,  this.contest});

  String formatTimestamp(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('MMMM dd, yyyy • hh:mm a').format(date);
  }

  String formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  }

  @override
  Widget build(BuildContext context) {
    final startTime = formatTimestamp(contest['start_time']);
    final endTime = formatTimestamp(contest['end_time']);
    final duration = formatDuration(contest['duration']);
    final descriptionHtml =
        contest['descriptionHtml'] ?? "<p>No description available.</p>";

    final name = contest['name'];
    final platform = contest['platform'];
    final url = contest['url'];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(name), backgroundColor: Colors.yellowAccent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Platform and badge
            Row(
              children: [
                Icon(Icons.code, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  platform.toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Start / End / Duration
            _infoTile("Start Time", startTime),
            _infoTile("End Time", endTime),
            _infoTile("Duration", duration),

            const Divider(height: 32),

            const Text(
              "Contest Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Html(
              data: descriptionHtml,

              style: {"body": Style(color: Colors.white)},
            ),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton.icon(
                onPressed: () => launchUrl(Uri.parse(url)),
                icon: const Icon(Icons.open_in_new),
                label: const Text("Go to Contest"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // backgroundColor: Colors.black,
    );
  }

  Widget _infoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(Icons.calendar_today_outlined, color: Colors.white70, size: 18),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
