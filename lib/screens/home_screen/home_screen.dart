import 'package:flutter/material.dart';

import '../../utils/styles.dart';
import 'components/header_panel.dart';
import 'components/plan_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const HeaderPanel(),
              const SizedBox(height: 20.0),
              Text(
                'TODAY\'S PLAN',
                style: textInfoStyle,
              ),
              const SizedBox(height: 20.0),
              const PlanListView(),
            ],
          ),
        ),
      ),
    );
  }
}
