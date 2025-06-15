import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  static final RemoteConfigService _instance = RemoteConfigService._internal();

  factory RemoteConfigService() => _instance;

  RemoteConfigService._internal();

  late FirebaseRemoteConfig _remoteConfig;

  Future<void> initialize() async {
    _remoteConfig = FirebaseRemoteConfig.instance;

    // Step 1: Set default values
    await _remoteConfig.setDefaults(<String, dynamic>{
      'baseAPI': 'https://contesthunt-api.onrender.com/',
    });

    // Step 2: Configure settings
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );

    // Step 3: Fetch and activate values
    await _remoteConfig.fetchAndActivate();
  }

  // Safe getter for baseAPI
  String get baseAPI => _remoteConfig.getString('baseAPI');
}
