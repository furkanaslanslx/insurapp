import 'package:flutter/material.dart';
import 'package:insurance/services/responsive.dart';
import 'package:insurance/v/wdgts/insurance_plan_button.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class InsuranceCalculatorSection extends StatefulWidget {
  const InsuranceCalculatorSection({super.key});

  @override
  State<InsuranceCalculatorSection> createState() => _InsuranceCalculatorSectionState();
}

class _InsuranceCalculatorSectionState extends State<InsuranceCalculatorSection> {
  final ResponsiveSize _size = ResponsiveSize();

  int x = 5;

  int y = 5;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return SizedBox(
        width: _size.getWidth(context, 670),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sigorta Hesaplayıcı",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: themeNotifier.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Eğitim Planı\n5 Kişi\n3 Yıl",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "₺12,738.50",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text("Sigorta Planı", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InsurancePlanButton(text: "Emeklilik"),
                InsurancePlanButton(text: "Eğitim", isSelected: true),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InsurancePlanButton(text: "Ev"),
                InsurancePlanButton(text: "Araba"),
                InsurancePlanButton(text: "Aile"),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Kişi Sayısı", style: TextStyle(fontSize: 16)),
            Slider(
              thumbColor: themeNotifier.primaryColor,
              activeColor: themeNotifier.primaryColor.withValues(alpha: 0.7),
              value: x.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              label: "$x Kişi",
              onChanged: (value) {
                setState(() {
                  if (value > value.toInt() + 0.5) {
                    x = value.toInt() + 1;
                  } else {
                    x = value.toInt();
                  }
                });
              },
            ),
            const Text("Süre", style: TextStyle(fontSize: 16)),
            Slider(
              thumbColor: themeNotifier.primaryColor,
              activeColor: themeNotifier.primaryColor.withValues(alpha: 0.7),
              value: y.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              label: "$y Yıl",
              onChanged: (value) {
                setState(() {
                  if (value > value.toInt() + 0.5) {
                    y = value.toInt() + 1;
                  } else {
                    y = value.toInt();
                  }
                });
                // setState(() {
                //   y = value.toInt();
                // });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Şimdi Al"),
            ),
          ],
        ),
      );
    });
  }
}
