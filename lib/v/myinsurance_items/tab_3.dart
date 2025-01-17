import 'package:flutter/material.dart';
import 'package:insurance/m/policy_model.dart';
import 'package:insurance/services/variables.dart';
import 'package:insurance/v/wdgts/mylisttile_wdgt.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class Tab3 extends StatelessWidget {
  final Policy policy;
  const Tab3({super.key, required this.policy});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return ListView.builder(
        itemCount: policy.paymentPlan.length,
        itemBuilder: (context, index) {
          return MylisttileWdgt(
            leading: const Icon(Icons.monetization_on, color: textColor),
            title: policy.paymentPlan[index].date,
            subtitle: policy.paymentPlan[index].amount,
            onTap: () {},
            textColor: textColor,
            backgroundColor: themeNotifier.primaryColor,
          );
        },
      );
    });
  }
}
