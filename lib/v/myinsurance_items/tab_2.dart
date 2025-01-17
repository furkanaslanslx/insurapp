import 'package:flutter/material.dart';
import 'package:insurance/m/policy_model.dart';
import 'package:insurance/services/responsive.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class Tab2 extends StatelessWidget {
  final Policy policy;
  const Tab2({super.key, required this.policy});

  @override
  Widget build(BuildContext context) {
    final ResponsiveSize size = ResponsiveSize();
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return Padding(
        padding: EdgeInsets.all(size.getWidth(context, 35)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Kişi',
              style: TextStyle(
                color: themeNotifier.primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Katkı Yapan:'),
                const Spacer(),
                Text(policy.customers.first.customerName),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Durum:'),
                const Spacer(),
                Text(policy.status),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Döviz',
              style: TextStyle(
                color: themeNotifier.primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Plan Dövizi:'),
                const Spacer(),
                Text(policy.policyGuarantees[0].currency),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Geri Alım Dövizi:'),
                const Spacer(),
                Text(policy.policyGuarantees[0].currency),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Toplam',
              style: TextStyle(
                color: themeNotifier.primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Toplam Katkılar:'),
                const Spacer(),
                Text(policy.policyNo),
              ],
            ),
          ],
        ),
      );
    });
  }
}
