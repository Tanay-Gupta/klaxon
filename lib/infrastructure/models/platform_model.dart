enum PlatformType { contest, hackathon, bounty }

class PlatformModel {
  final String key;
  final String displayName;
  final String logoPath;
  final String url;
  final PlatformType type;

  const PlatformModel({
    required this.key,
    required this.displayName,
    required this.logoPath,
    required this.url,
    required this.type,
  });
}
