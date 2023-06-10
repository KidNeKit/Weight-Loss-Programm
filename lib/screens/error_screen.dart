import 'package:flutter/material.dart';

import '../utils/styles.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Network connection is required, please restart the application',
            style: errorText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
