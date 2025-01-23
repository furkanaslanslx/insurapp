import 'package:flutter/cupertino.dart';
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
      "imagePath": "https://storage.acerapps.io/app-1141/public/20221019/hasar.svg",
      "icon": CupertinoIcons.exclamationmark_triangle_fill,
      "color": Colors.deepPurpleAccent,
      "options": [
        {"subTitle": "Hasar ve Yardım", "icon": CupertinoIcons.shield},
      ]
    },
    {
      "title": "Hasar İhbarı",
      "imagePath": "https://storage.acerapps.io/app-1141/public/20221019/hasar.svg",
      "icon": CupertinoIcons.money_dollar_circle_fill,
      "color": Colors.deepOrangeAccent,
      "options": [
        {"subTitle": "Online İhbar", "icon": CupertinoIcons.cloud_upload},
        {"subTitle": "Telefon ile İhbar", "icon": CupertinoIcons.phone},
        {"subTitle": "Mobil İhbar", "icon": CupertinoIcons.device_phone_portrait},
      ]
    },
    {
      "title": "Anlaşmalı Servisler",
      "imagePath": "https://storage.acerapps.io/app-1141/public/20221019/hasar.svg",
      "icon": CupertinoIcons.car_fill,
      "color": Colors.redAccent,
      "options": [
        {"subTitle": "Servis Bul", "icon": CupertinoIcons.location},
        {"subTitle": "Randevu Al", "icon": CupertinoIcons.calendar},
        {"subTitle": "Servis Değerlendir", "icon": CupertinoIcons.star},
      ]
    },
    {
      "title": "Anlaşmalı Sağlık Kurumları",
      "imagePath": "https://storage.acerapps.io/app-1141/public/20221019/hasar.svg",
      "icon": CupertinoIcons.building_2_fill,
      "color": Colors.lightBlueAccent,
      "options": [
        {"subTitle": "Hastane Bul", "icon": CupertinoIcons.search},
        {"subTitle": "Randevu Al", "icon": CupertinoIcons.calendar_today},
        {"subTitle": "Doktor Ara", "icon": CupertinoIcons.person},
      ]
    },
    {
      "title": "Anlaşmalı Servis Başvurusu",
      "imagePath": "https://storage.acerapps.io/app-1141/public/20221019/hasar.svg",
      "icon": CupertinoIcons.bag_fill,
      "color": Colors.lightGreenAccent,
      "options": [
        {"subTitle": "Başvuru Yap", "icon": CupertinoIcons.add_circled},
        {"subTitle": "Başvuru Takip", "icon": CupertinoIcons.search_circle},
        {"subTitle": "Başvuru İptal", "icon": CupertinoIcons.clear_circled},
      ]
    },
    {
      "title": "Tedarikçi Başvurusu",
      "imagePath": "https://storage.acerapps.io/app-1141/public/20221019/hasar.svg",
      "icon": CupertinoIcons.wrench_fill,
      "color": Colors.amberAccent,
      "options": [
        {"subTitle": "Yeni Başvuru", "icon": CupertinoIcons.doc_text_fill},
        {"subTitle": "Başvuru Sorgula", "icon": CupertinoIcons.doc_plaintext},
        {"subTitle": "Belgeler", "icon": CupertinoIcons.folder_fill},
      ]
    },
  ];

  Widget _buildCard(int index, ThemeNotifier themeNotifier) {
    return SizedBox(
      width: double.infinity,
      height: 108,
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
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  categories[index]["icon"],
                  size: 32,
                  color: themeNotifier.secondaryColor,
                ),
                // Image.network(categories[index]["imagePath"]),
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
    final options = categories[index]["options"] as List<Map<String, dynamic>>;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      margin: EdgeInsets.only(left: 4, right: 4, bottom: selectedIndex == index ? 16 : 0),
      height: selectedIndex == index ? (options.length * 48.0) : 0,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: themeNotifier.primaryColor,
          width: 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: options
              .map((option) => ListTile(
                    dense: true,
                    leading: Icon(option["icon"]),
                    title: Text(
                      option["subTitle"].toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: themeNotifier.primaryColor,
                        fontWeight: FontWeight.bold,
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
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                padding: EdgeInsets.only(
                                  left: i.isEven ? 0 : 8,
                                  right: i.isEven ? 8 : 0,
                                  bottom: isMovedList[i] ? 20.0 : 10.0,
                                ),
                                curve: Curves.easeOut,
                                transform: Matrix4.translationValues(0.0, isMovedList[i] ? 10.0 : 0.0, 0.0),
                                child: _buildCard(i, themeNotifier),
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
