import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../utils/styles.dart';

class HeaderPanel extends StatelessWidget {
  const HeaderPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SingleStat(text: 'Days Streak', value: '18'),
        CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 10.0,
            center: const SingleStat(
              text: 'DAY',
              value: '30',
              isMain: true,
            )),
        const SingleStat(text: 'Days Skipped', value: '18'),
      ],
    );
  }
}

class SingleStat extends StatelessWidget {
  final String text;
  final String value;
  final bool isMain;

  const SingleStat(
      {required this.text,
      required this.value,
      this.isMain = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: isMain ? mainDayInfoStyle : dayInfoStyle,
        ),
        Text(
          text,
          style: isMain ? mainTextInfoStyle : textInfoStyle,
        ),
      ],
    );
  }
}
