import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../dependency_injection.dart';
import '../../../repositories/plans_repository.dart';
import '../../../utils/styles.dart';

class HeaderPanel extends StatelessWidget {
  const HeaderPanel({super.key});

  @override
  Widget build(BuildContext context) {
    var plansRepository = locator.call<PlansRepository>();
    return Center(
      child: CircularPercentIndicator(
        radius: 60.0,
        lineWidth: 10.0,
        percent: plansRepository.getCurrentDay() / 30,
        center: SingleStat(
          text: 'DAY',
          value: plansRepository.getCurrentDay().toString(),
        ),
      ),
    );
  }
}

class SingleStat extends StatelessWidget {
  final String text;
  final String value;

  const SingleStat({required this.text, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: mainDayInfoStyle,
        ),
        Text(
          text,
          style: mainTextInfoStyle,
        ),
      ],
    );
  }
}
