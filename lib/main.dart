import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'dependency_injection.dart';
import 'repositories/url_receiver_repository.dart';
import 'screens/error_screen.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/webview_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initDI();
  var receiver = locator.call<UrlReceiverRepository>();
  if (await receiver.hasNetwork()) {
    try {
      await receiver.init();
      runApp(const MyApp());
    } catch (e) {
      log('Error during url receiving: $e');
      runApp(const ErrorApp());
    }
  } else {
    runApp(const ErrorApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: locator.call<UrlReceiverRepository>().isFakeAppShown,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (!snapshot.hasData) {
            return const ErrorScreen();
          }
          return snapshot.data! ? const HomeScreen() : const WebviewScreen();
        },
      ),
    );
  }
}

class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ErrorScreen(),
    );
  }
}
