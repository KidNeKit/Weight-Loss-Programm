import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UrlReceiverRepository {
  final FirebaseRemoteConfig _remoteConfig;
  String? _url;

  UrlReceiverRepository(FirebaseRemoteConfig remoteConfig)
      : _remoteConfig = remoteConfig;

  Future<void> init() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    _url = sharedPreferences.getString('url');
    log('Local url: $_url');
    if (_url == null || _url!.isEmpty) {
      await _remoteConfig.ensureInitialized();
      await _remoteConfig.fetchAndActivate();
      _url = _remoteConfig.getString('url');
      sharedPreferences.setString('url', _url!);
      log('Take remote url: $_url');
    }
  }

  String? get url => _url;
}
