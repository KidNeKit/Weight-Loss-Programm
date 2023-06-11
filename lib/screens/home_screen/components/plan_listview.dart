import 'package:flutter/material.dart';

import '../../../data/plans_data.dart';
import '../../../utils/styles.dart';

class PlanListView extends StatelessWidget {
  const PlanListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => PlanItem(plan: plans[index]),
        itemCount: plans.length,
        separatorBuilder: (_, index) => const SizedBox(height: 5.0),
      ),
    );
  }
}

class PlanItem extends StatelessWidget {
  final String plan;
  const PlanItem({required this.plan, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(),
      ),
      child: Text(
        plan,
        overflow: TextOverflow.ellipsis,
        style: listViewItem,
      ),
    );
  }
}
