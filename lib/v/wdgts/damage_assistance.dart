import 'package:flutter/material.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';
import 'dart:math' show min;

class DamageAssistance extends StatefulWidget {
  const DamageAssistance({super.key});

  @override
  State<DamageAssistance> createState() => _DamageAssistanceState();
}

class _DamageAssistanceState extends State<DamageAssistance> {
  int? selectedIndex;
  List<bool> isMovedList = List.generate(6, (index) => false);

  final List<Map<String, dynamic>> categories = [
    {
      "title": "Hasar Anında",
      "icon": Icons.warning,
      "color": Colors.deepPurpleAccent,
      "options": ["Kaza Tutanağı", "Acil Yardım", "Çekici Hizmeti"]
    },
    {
      "title": "Hasar İhbarı",
      "icon": Icons.attach_money,
      "color": Colors.deepOrangeAccent,
      "options": ["Online İhbar", "Telefon ile İhbar", "Mobil İhbar"]
    },
    {
      "title": "Anlaşmalı Servisler",
      "icon": Icons.directions_car,
      "color": Colors.redAccent,
      "options": ["Servis Bul", "Randevu Al", "Servis Değerlendir"]
    },
    {
      "title": "Anlaşmalı Sağlık Kurumları",
      "icon": Icons.business,
      "color": Colors.lightBlueAccent,
      "options": ["Hastane Bul", "Randevu Al", "Doktor Ara"]
    },
    {
      "title": "Anlaşmalı Servis Başvurusu",
      "icon": Icons.shopping_bag,
      "color": Colors.lightGreenAccent,
      "options": ["Başvuru Yap", "Başvuru Takip", "Başvuru İptal"]
    },
    {
      "title": "Tedarikçi Başvurusu",
      "icon": Icons.engineering,
      "color": Colors.amberAccent,
      "options": ["Yeni Başvuru", "Başvuru Sorgula", "Belgeler"]
    },
  ];

  Widget _buildCard(int index, ThemeNotifier themeNotifier) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Card(
        elevation: isMovedList[index] ? 8 : 4,
        color: themeNotifier.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: Colors.white,
            width: isMovedList[index] ? 2 : 1,
          ),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              isMovedList[index] = !isMovedList[index];
              selectedIndex = isMovedList[index] ? index : null;

              for (int i = 0; i < isMovedList.length; i++) {
                if (i != index) {
                  isMovedList[i] = false;
                }
              }
            });
          },
          borderRadius: BorderRadius.circular(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                categories[index]["icon"],
                size: 32,
                color: themeNotifier.secondaryColor,
              ),
              const SizedBox(height: 8),
              Text(
                categories[index]["title"],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptions(int index, int rowIndex) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        final firstIndex = rowIndex * 2;
        final secondIndex = firstIndex + 1;
        final isFirstSelected = selectedIndex == firstIndex;
        final isSecondSelected = selectedIndex == secondIndex && secondIndex < categories.length;

        return Stack(
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isFirstSelected ? 1.0 : 0.0,
              child: _buildOptionsList(firstIndex, themeNotifier),
            ),
            if (secondIndex < categories.length)
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isSecondSelected ? 1.0 : 0.0,
                child: _buildOptionsList(secondIndex, themeNotifier),
              ),
          ],
        );
      },
    );
  }

  Widget _buildOptionsList(int index, ThemeNotifier themeNotifier) {
    final options = categories[index]["options"] as List<dynamic>;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      margin: EdgeInsets.only(left: 4, right: 4, bottom: selectedIndex == index ? 16 : 0),
      height: selectedIndex == index ? (options.length * 48.0) : 0,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: themeNotifier.primaryColor,
          width: 2,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: options
              .map((option) => ListTile(
                    dense: true,
                    title: Text(
                      option.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        color: themeNotifier.primaryColor,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: themeNotifier.primaryColor,
                    ),
                    onTap: () {
                      // TODO: Handle option tap
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text("Acil Yardım", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: themeNotifier.secondaryColor)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: (categories.length / 2).ceil(),
                itemBuilder: (context, rowIndex) {
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = rowIndex * 2; i < min((rowIndex + 1) * 2, categories.length); i++)
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: i.isEven ? 0 : 8,
                                  right: i.isEven ? 8 : 0,
                                  bottom: isMovedList[i] ? 20.0 : 10.0,
                                ),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                  transform: Matrix4.translationValues(0, isMovedList[i] ? 10.0 : 0.0, 0),
                                  child: _buildCard(i, themeNotifier),
                                ),
                              ),
                            ),
                        ],
                      ),
                      _buildOptions(rowIndex * 2, rowIndex),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
