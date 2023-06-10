import 'package:flutter/material.dart';
import 'package:weight_loss_programm/utils/styles.dart';

class PlanListView extends StatelessWidget {
  const PlanListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => const PlanItem(),
        itemCount: 30,
        separatorBuilder: (_, index) => const SizedBox(height: 5.0),
      ),
    );
  }
}

class PlanItem extends StatelessWidget {
  const PlanItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Text',
              overflow: TextOverflow.ellipsis,
              style: listViewItem,
            ),
          ),
          Checkbox(value: false, onChanged: (value) {}),
        ],
      ),
    );
  }
}
