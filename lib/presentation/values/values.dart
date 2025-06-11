// ignore_for_file: constant_identifier_names

const String appName = "Contest Hunt"; // change this to your app name
const String baseAPI = "https://contesthunt-api.onrender.com/";
const livePulseAnimation = 'assets/animations/livePulse.json';

//---------------------------------------App Bar Titles---------------------------------------//
const String homeTitle = 'Contest Hunt';
const String contestTitle = 'Contests';
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

//---------------------------------------API Errors---------------------------------------//
const String apiError = 'API Error';
const String apiErrorMessage =
    'Failed to fetch data from the API. Please try again later.';

//---------------------------------------Page Images---------------------------------------//

const String bountyImage = 'assets/icons/bounty_screen/bug-fixing.svg';

const contest_platforms = [
  'atcoder',
  'code360',
  'codechef',
  'codeforces',
  'csacademy',
  'geeksforgeeks',
  'hackerearth',
  'leetcode',
  'nowcoder',
  'topcoder',
];
const hackathon_platforms = ['devfolio', 'devpost', 'unstop'];
const bounty_platforms = ['replit'];

//---------------------------------------Coding Platform Logo---------------------------------------//

const String leetcodeLogo = 'assets/icons/coding_platforms/leetcode.svg';
const String codechefLogo = 'assets/icons/coding_platforms/codechef.svg';
const String hackerrankLogo = 'assets/icons/coding_platforms/hackerrank.svg';
const String codeforcesLogo = 'assets/icons/coding_platforms/codeforces.svg';
const String atcoderLogo = 'assets/icons/coding_platforms/atcoder.svg';
const String topcoderLogo = 'assets/icons/coding_platforms/topcoder.svg';
const String nowcoderLogo = 'assets/icons/coding_platforms/nowcoder.svg';
const String geeksforgeekLogo =
    'assets/icons/coding_platforms/geeksforgeeks.svg';
const String hackerearthLogo = 'assets/icons/coding_platforms/hackerearth.svg';
const String code360Logo = 'assets/icons/coding_platforms/code360.svg';
const String csacademyLogo = 'assets/icons/coding_platforms/csacademy.svg';
const String requestplatformLogo =
    'assets/icons/coding_platforms/requestplatform.svg';
const String devfolioLogo = 'assets/icons/coding_platforms/devfolio.svg';
const String replitLogo = 'assets/icons/coding_platforms/replit.svg';

//---------------------------------------Coding Platform Names---------------------------------------//
const String leetcode = 'leetcode';
const String codechef = 'codechef';
const String hackerrank = 'hackerrank';
const String codeforces = 'codeforces';
const String atcoder = 'atcoder';
const String topcoder = 'topcoder';
const String nowcoder = 'nowcoder';
const String geeksforgeeks = 'geeksforgeeks';
const String hackerearth = 'hackerearth';
const String code360 = 'code360';
const String csacademy = 'csacademy';
const String requestplatform = 'RequestPlatform';
const String devfolio = 'Devfolio';
const String replit = 'Replit';

//---------------------------------------Coding Platform URLs---------------------------------------//
const String leetcodeURL = 'https://leetcode.com/';
const String codechefURL = 'https://www.codechef.com/';
const String hackerrankURL = 'https://www.hackerrank.com/';
const String codeforcesURL = 'https://codeforces.com/';
const String atcoderURL = 'https://atcoder.jp/';
const String topcoderURL = 'https://www.topcoder.com/';
const String nowcoderURL = 'https://www.nowcoder.com/';
const String geeksforgeekURL = 'https://www.geeksforgeeks.org/';
const String hackerearthURL = 'https://www.hackerearth.com/';
const String code360URL = 'https://www.codingninjas.com/';
const String csacademyURL = 'https://csacademy.com/';
const String requestplatformURL = 'https://requestplatform.com/';
const String devfolioURL = 'https://devfolio.co/';
const String replitURL = 'https://replit.com/';

//---------------------------------------Coding Platform Map of name to logo---------------------------------------//

const Map<String, String> platformLogos = {
  leetcode: leetcodeLogo,
  codechef: codechefLogo,
  hackerrank: hackerrankLogo,
  codeforces: codeforcesLogo,
  atcoder: atcoderLogo,
  topcoder: topcoderLogo,
  nowcoder: nowcoderLogo,
  geeksforgeeks: geeksforgeekLogo,
  hackerearth: hackerearthLogo,
  code360: code360Logo,
  csacademy: csacademyLogo,
  requestplatform: requestplatformLogo,
  devfolio: devfolioLogo,
  replit: replitLogo,
};
//---------------------------------------Coding Platform Map of name to URL---------------------------------------//
const Map<String, String> platformURLs = {
  leetcode: leetcodeURL,
  codechef: codechefURL,
  hackerrank: hackerrankURL,
  codeforces: codeforcesURL,
  atcoder: atcoderURL,
  topcoder: topcoderURL,
  nowcoder: nowcoderURL,
  geeksforgeeks: geeksforgeekURL,
  hackerearth: hackerearthURL,
  code360: code360URL,
  csacademy: csacademyURL,
  requestplatform: requestplatformURL,
  devfolio: devfolioURL,
  replit: replitURL,
};

//---------------------------------------Coding Platform Map of name to display name---------------------------------------//
const Map<String, String> platformDisplayNames = {
  leetcode: 'LeetCode',
  codechef: 'CodeChef',
  hackerrank: 'HackerRank',
  codeforces: 'Codeforces',
  atcoder: 'AtCoder',
  topcoder: 'TopCoder',
  nowcoder: 'NowCoder',
  geeksforgeeks: 'GFG',
  hackerearth: 'HackerEarth',
  code360: 'CodingNinjas',
  csacademy: 'CSAcademy',
  requestplatform: 'RequestUs',
  devfolio: 'Devfolio',
  replit: 'Replit',
};
//---------------------------------------Contest Platforms with key name and icon path---------------------------------------//
const List<Map<String, String>> contestPlatforms = [
  {'name': leetcode, 'icon': leetcodeLogo},
  {'name': codechef, 'icon': codechefLogo},
  {'name': hackerrank, 'icon': hackerrankLogo},
  {'name': codeforces, 'icon': codeforcesLogo},
  {'name': atcoder, 'icon': atcoderLogo},
  {'name': topcoder, 'icon': topcoderLogo},
  {'name': nowcoder, 'icon': nowcoderLogo},
  {'name': geeksforgeeks, 'icon': geeksforgeekLogo},
  {'name': hackerearth, 'icon': hackerearthLogo},
  {'name': code360, 'icon': code360Logo},
  {'name': csacademy, 'icon': csacademyLogo},
  {'name': requestplatform, 'icon': requestplatformLogo},
];
//---------------------------------------Hackathon Platforms with key name and icon path---------------------------------------//
const List<Map<String, String>> hackathonPlatforms = [
  {'name': devfolio, 'icon': devfolioLogo},
  {'name': replit, 'icon': replitLogo},
  {'name': hackerearth, 'icon': hackerearthLogo},
  {'name': requestplatform, 'icon': requestplatformLogo},
];
