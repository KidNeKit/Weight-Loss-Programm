import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigRepository {
  final FirebaseRemoteConfig _remoteConfig;

  FirebaseRemoteConfigRepository(FirebaseRemoteConfig remoteConfig)
      : _remoteConfig = remoteConfig;

  Future<void> init() async {
    await _remoteConfig.ensureInitialized();
    await _remoteConfig.fetchAndActivate();
  }

  String get url => _remoteConfig.getString('url');
}
