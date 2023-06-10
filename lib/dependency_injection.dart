import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';

import 'repositories/firebase_remote_config_repository.dart';

final locator = GetIt.instance;

Future<void> initDI() async {
  locator.registerLazySingleton<FirebaseRemoteConfig>(
      () => FirebaseRemoteConfig.instance);

  locator.registerLazySingleton<FirebaseRemoteConfigRepository>(
      () => FirebaseRemoteConfigRepository(locator.call()));
}
