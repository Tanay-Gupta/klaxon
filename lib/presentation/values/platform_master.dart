
import '../../infrastructure/models/platform_model.dart';

const List<PlatformModel> allPlatforms = [
  // Contest Platforms
  PlatformModel(
    key: 'leetcode',
    displayName: 'LeetCode',
    logoPath: 'assets/icons/coding_platforms/leetcode.svg',
    url: 'https://leetcode.com/',
    type: PlatformType.contest,
  ),
  PlatformModel(
    key: 'codechef',
    displayName: 'CodeChef',
    logoPath: 'assets/icons/coding_platforms/codechef.svg',
    url: 'https://www.codechef.com/',
    type: PlatformType.contest,
  ),
  PlatformModel(
    key: 'hackerrank',
    displayName: 'HackerRank',
    logoPath: 'assets/icons/coding_platforms/hackerrank.svg',
    url: 'https://www.hackerrank.com/',
    type: PlatformType.contest,
  ),
  PlatformModel(
    key: 'codeforces',
    displayName: 'Codeforces',
    logoPath: 'assets/icons/coding_platforms/codeforces.svg',
    url: 'https://codeforces.com/',
    type: PlatformType.contest,
  ),
  PlatformModel(
    key: 'atcoder',
    displayName: 'AtCoder',
    logoPath: 'assets/icons/coding_platforms/atcoder.svg',
    url: 'https://atcoder.jp/',
    type: PlatformType.contest,
  ),
  PlatformModel(
    key: 'topcoder',
    displayName: 'TopCoder',
    logoPath: 'assets/icons/coding_platforms/topcoder.svg',
    url: 'https://www.topcoder.com/',
    type: PlatformType.contest,
  ),
  PlatformModel(
    key: 'nowcoder',
    displayName: 'NowCoder',
    logoPath: 'assets/icons/coding_platforms/nowcoder.svg',
    url: 'https://www.nowcoder.com/',
    type: PlatformType.contest,
  ),
  PlatformModel(
    key: 'geeksforgeeks',
    displayName: 'GFG',
    logoPath: 'assets/icons/coding_platforms/geeksforgeeks.svg',
    url: 'https://www.geeksforgeeks.org/',
    type: PlatformType.contest,
  ),
  PlatformModel(
    key: 'hackerearth',
    displayName: 'HackerEarth',
    logoPath: 'assets/icons/coding_platforms/hackerearth.svg',
    url: 'https://www.hackerearth.com/',
    type: PlatformType.contest,
  ),
  PlatformModel(
    key: 'code360',
    displayName: 'CodingNinjas',
    logoPath: 'assets/icons/coding_platforms/code360.svg',
    url: 'https://www.codingninjas.com/',
    type: PlatformType.contest,
  ),
  PlatformModel(
    key: 'csacademy',
    displayName: 'CSAcademy',
    logoPath: 'assets/icons/coding_platforms/csacademy.svg',
    url: 'https://csacademy.com/',
    type: PlatformType.contest,
  ),
  PlatformModel(
    key: 'requestplatform',
    displayName: 'RequestUs',
    logoPath: 'assets/icons/coding_platforms/requestplatform.svg',
    url: 'https://requestplatform.com/',
    type: PlatformType.contest,
  ),

  // Hackathon Platforms
  PlatformModel(
    key: 'devfolio',
    displayName: 'Devfolio',
    logoPath: 'assets/icons/coding_platforms/devfolio.svg',
    url: 'https://devfolio.co/',
    type: PlatformType.hackathon,
  ),
  PlatformModel(
    key: 'unstop',
    displayName: 'Unstop',
    logoPath: 'assets/icons/coding_platforms/unstop.svg',
    url: 'https://unstop.com/',
    type: PlatformType.hackathon,
  ),
  PlatformModel(
    key: 'devpost',
    displayName: 'Devpost',
    logoPath: 'assets/icons/coding_platforms/devpost.svg',
    url: 'https://devpost.com/',
    type: PlatformType.hackathon,
  ),
  PlatformModel(
    key: 'requestplatform',
    displayName: 'RequestUs',
    logoPath: 'assets/icons/coding_platforms/requestplatform.svg',
    url: 'https://requestplatform.com/',
    type: PlatformType.hackathon,
  ),

  // Bounty Platforms
  PlatformModel(
    key: 'replit',
    displayName: 'Replit',
    logoPath: 'assets/icons/coding_platforms/replit.svg',
    url: 'https://replit.com/',
    type: PlatformType.bounty,
  ),
];

/// Maps for platform data
final Map<String, String> platformLogos = {
  for (var p in allPlatforms) p.key: p.logoPath,
};

final Map<String, String> platformURLs = {
  for (var p in allPlatforms) p.key: p.url,
};

final Map<String, String> platformDisplayNames = {
  for (var p in allPlatforms) p.key: p.displayName,
};

/// Filtered platform groups
final List<String> contest_platforms = allPlatforms
    .where((p) => p.type == PlatformType.contest)
    .map((p) => p.key)
    .toList();

final List<String> hackathon_platforms = allPlatforms
    .where((p) => p.type == PlatformType.hackathon)
    .map((p) => p.key)
    .toList();

final List<String> bounty_platforms = allPlatforms
    .where((p) => p.type == PlatformType.bounty)
    .map((p) => p.key)
    .toList();

/// List containers for UI usage
final List<Map<String, String>> contestPlatforms = allPlatforms
    .where((p) => p.type == PlatformType.contest)
    .map((p) => {'name': p.key, 'icon': p.logoPath})
    .toList();

final List<Map<String, String>> hackathonPlatforms = allPlatforms
    .where((p) => p.type == PlatformType.hackathon)
    .map((p) => {'name': p.key, 'icon': p.logoPath})
    .toList();

final List<Map<String, String>> bountyPlatforms = allPlatforms
    .where((p) => p.type == PlatformType.bounty)
    .map((p) => {'name': p.key, 'icon': p.logoPath})
    .toList();
