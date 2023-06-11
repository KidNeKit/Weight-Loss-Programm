import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'repositories/plans_repository.dart';
import 'repositories/url_receiver_repository.dart';

final locator = GetIt.instance;

Future<void> initDI() async {
  locator.registerLazySingleton<FirebaseRemoteConfig>(
      () => FirebaseRemoteConfig.instance);

  locator.registerLazySingleton<UrlReceiverRepository>(
      () => UrlReceiverRepository(locator.call()));

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<PlansRepository>(
      () => PlansRepository(sharedPreferences));
}
