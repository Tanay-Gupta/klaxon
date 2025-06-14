// ignore_for_file: constant_identifier_names

const String appName = "Contest Hunt"; // change this to your app name
const String baseAPI = "https://contesthunt-api.onrender.com/";
const String privacyPolicyUrl="https://miraidyo.github.io/contesthunt-legal/privacy-policy.html";
const String termAndConditionUrl="https://miraidyo.github.io/contesthunt-legal/terms-and-conditions.html";

const livePulseAnimation = 'assets/animations/livePulse.json';

//---------------------------------------App Bar Titles---------------------------------------//
const String homeTitle = 'Contest Hunt';
const String contestTitle = 'Contests';
const String notificationsTitle = 'Notifications';
const String hackathonsTitle = 'Hackathons';
const String bountyTitle = 'Bounty';
const String settingsTitle = 'Settings';

//---------------------------------------Screens Tag Line---------------------------------------//
const String contestTagline = 'Competitive Programming Platforms';
const String hackathonsTagline = 'Get ready to code and win exciting prizes!';
const String bountyTagline = 'Discover, and earn rewards with bounties!';
const String settingsTagline = 'Settings';

//---------------------------------------Tab errors---------------------------------------//
const String noContestsFound = 'No contests found';
const String noHackathonsFound = 'No hackathons found';
const String noBountiesFound = 'No bounties found';
const String noDataFound = 'No data found';
const String noUpcomingContests = 'No upcoming contests';
const String noOngoingContests = 'No ongoing contests';

//---------------------------------------API Errors---------------------------------------//
const String apiError = 'API Error';
const String apiErrorMessage =
    'Failed to fetch data from the API. Please try again later.';

//---------------------------------------Page Images---------------------------------------//

const String bountyImage = 'assets/icons/bounty_screen/bug-fixing.svg';
const String noNotificationIllistration = 'assets/icons/no_notification.svg';

const List<String> kFunnyNotificationMessages = [
  "📬 Reminder launched into the notification multiverse! 💥",
  "⚔️ Alert armed! Ready for the code war!",
  "🚀 Notification deployed successfully. CI/CD approved.",
  "🤖 Beep boop... Notification scheduled with 99.9% accuracy.",
  "🎯 Notification hit its breakpoint.",
  "⏰ Reminder set! Now go touch some grass 🌱",
  "📦 Notification packaged, shipped, and delivered!",
  "🧠 Task scheduled. Brain cells will thank you later.",
  "🔔 Ding dong! Your future self says thanks.",
  "👨‍💻 Code gods have acknowledged your notification.",
  "💡 A wild reminder appears in the terminal!",
  "📱 Notification armed and dangerously on time!",
  "🔥 Scheduled faster than a merge conflict!",
  "📆 Notification added. Now you have no excuse.",
  "🪄 Reminder spell cast successfully. Magic awaits.",
  "🥷 Ninja alert scheduled. Stealth mode ON.",
];

const String shareAppText="""👀 Bro, still missing contests and pretending you “didn’t know”?
Yeah, sure.

Just get this app — ContestHunt.
It shows all coding contests, hackathons, bug bounty stuff in one place — Codeforces, LeetCode, Devfolio, whatever you’re into.

⏰ Sends reminders so you don’t “forget” and blame timezones again.
🕒 Contest times are auto-adjusted to IST — like a good friend should be.
🎯 Also looks clean, runs smooth, and actually helps you get your life together (well, sort of).

Just trust me and try it once: [https://play.google.com/store/apps/details?id=com.miraidyo.contesthunt]
Unless you like getting late to contests and crying over your rating. 😌
""";


const String dummyFeedback="""Hi ContestHunt Team,

I’ve been using the app for a while and just wanted to share some feedback:

- What I liked: [e.g., clean UI, helpful reminders, supports all major platforms]
- What could be improved: [e.g., add filters by contest difficulty, dark mode enhancements]
- Feature I’d love to see: [e.g., add bookmark/save contest option]

Keep up the great work!

Cheers,  
[Your Name]
""";