import 'package:flutter/material.dart';
import 'package:insurance/m/policy_model.dart';
import 'package:insurance/services/responsive.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class Tab1 extends StatelessWidget {
  final Policy policy;
  const Tab1({super.key, required this.policy});

  @override
  Widget build(BuildContext context) {
    final ResponsiveSize size = ResponsiveSize();
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Padding(
          padding: EdgeInsets.all(size.getWidth(context, 35)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Ürün Tipi',
                style: TextStyle(
                  color: themeNotifier.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('Poliçe Planı:'),
                  const Spacer(),
                  Text(policy.productName),
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
                'Poliçe Tarihi',
                style: TextStyle(
                  color: themeNotifier.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('Başlangıç:'),
                  const Spacer(),
                  Text(policy.startDate),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('Bitiş:'),
                  const Spacer(),
                  Text(policy.endDate),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Poliçe Detayları',
                style: TextStyle(
                  color: themeNotifier.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('Poliçe Değeri:'),
                  const Spacer(),
                  Text(policy.policyNo),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
