import 'package:intl/intl.dart';
import 'package:klaxon/infrastructure/models/bounty_model.dart';
import 'package:klaxon/infrastructure/models/hackathon_model.dart';
import 'package:share_plus/share_plus.dart';
import '../../models/contest_model.dart'; // Update to correct path

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

void shareContest(ContestModel contest) {
  final start =
      contest.startTime != null
          ? _formatFullDateTime(_fromEpochToIso8601(contest.startTime ?? 0))
          : '???';
  final end =
      contest.endTime != null
          ? _formatFullDateTime(_fromEpochToIso8601(contest.endTime ?? 0))
          : '???';
  final durationHours =
      (contest.duration != null) ? (contest.duration! ~/ 3600) : '?';

  final shareText = '''
🚀 *${contest.name}* is on the radar!  
🛰️ Platform: *${contest.platform}*

📅 Starts: $start  
🏁 Ends: $end  
⏱ Duration: $durationHours hour(s)  
🔗 Join now: ${contest.url ?? 'Check Contest Hunt for details'}

💥 Whether it's:
👨‍💻 A coding contest to flex your LeetCode aura,  
🧑‍🚀 A hackathon to summon your full-stack powers, or  
🕵️‍♂️ A bounty to hunt like you're in the cyber wild west...  
This one’s calling your name, Senpai 🧠⚔️

🍜 So grab your IDE, your favorite debugging plushie 🐱‍💻, and let’s go full anime arc mode!

📲 _Shared via **Contest Hunt** — Your ninja scroll to every coding contest, hackathon & bounty out there!_  
✨ Join the squad:  
https://play.google.com/store/apps/details?id=com.miraidyo.contesthunt.app
''';

  SharePlus.instance.share(ShareParams(text: shareText.trim()));
}

void shareHackathon(HackathonModel contest) {
  final start =
      contest.startTime != null
          ? _formatFullDateTime(_fromEpochToIso8601(contest.startTime ?? 0))
          : '???';
  final end =
      contest.endTime != null
          ? _formatFullDateTime(_fromEpochToIso8601(contest.endTime ?? 0))
          : '???';
  final durationHours =
      (contest.duration != null) ? (contest.duration! ~/ 3600) : '?';

  final shareText = '''
🚀 *${contest.name}* is on the radar!  
🛰️ Platform: *${contest.platform}*

📅 Starts: $start  
🏁 Ends: $end  
⏱ Duration: $durationHours hour(s)  
🔗 Join now: ${contest.url ?? 'Check Contest Hunt for details'}

💥 Whether it's:
👨‍💻 A coding contest to flex your LeetCode aura,  
🧑‍🚀 A hackathon to summon your full-stack powers, or  
🕵️‍♂️ A bounty to hunt like you're in the cyber wild west...  
This one’s calling your name, Senpai 🧠⚔️

🍜 So grab your IDE, your favorite debugging plushie 🐱‍💻, and let’s go full anime arc mode!

📲 _Shared via **Contest Hunt** — Your ninja scroll to every coding contest, hackathon & bounty out there!_  
✨ Join the squad:  
https://play.google.com/store/apps/details?id=com.miraidyo.contesthunt.app
''';

  SharePlus.instance.share(ShareParams(text: shareText.trim()));
}

void shareBounty(BountyModel contest) {
  final start =
      contest.startTime != null
          ? _formatFullDateTime(_fromEpochToIso8601(contest.startTime ?? 0))
          : '???';
  final end =
      contest.endTime != null
          ? _formatFullDateTime(_fromEpochToIso8601(contest.endTime ?? 0))
          : '???';
  final durationHours =
      (contest.duration != null) ? (contest.duration! ~/ 3600) : '?';

  final shareText = '''
🚀 *${contest.name}* is on the radar!  
🛰️ Platform: *${contest.platform}*

📅 Starts: $start  
🏁 Ends: $end  
⏱ Duration: $durationHours hour(s)  
🤑 Amount: ${contest.amount} \$
🔗 Join now: ${contest.url ?? 'Check Contest Hunt for details'}

💥 Whether it's:
👨‍💻 A coding contest to flex your LeetCode aura,  
🧑‍🚀 A hackathon to summon your full-stack powers, or  
🕵️‍♂️ A bounty to hunt like you're in the cyber wild west...  
This one’s calling your name, Senpai 🧠⚔️

🍜 So grab your IDE, your favorite debugging plushie 🐱‍💻, and let’s go full anime arc mode!

📲 _Shared via **Contest Hunt** — Your ninja scroll to every coding contest, hackathon & bounty out there!_  
✨ Join the squad:  
https://play.google.com/store/apps/details?id=com.miraidyo.contesthunt.app
''';

  SharePlus.instance.share(ShareParams(text: shareText.trim()));
}
