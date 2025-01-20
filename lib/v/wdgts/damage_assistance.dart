import 'package:flutter/material.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';
import 'dart:math' show min;

class DamageAssistance extends StatefulWidget {
  const DamageAssistance({super.key});

  @override
  State<DamageAssistance> createState() => _DamageAssistanceState();
}

class _DamageAssistanceState extends State<DamageAssistance> with SingleTickerProviderStateMixin {
  int? selectedIndex;
  late AnimationController _controller;
  late Animation<double> _heightFactor;

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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heightFactor = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildCard(int index, ThemeNotifier themeNotifier) {
    final isSelected = selectedIndex == index;
    return Card(
      elevation: isSelected ? 8 : 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: categories[index]["color"],
          width: isSelected ? 4 : 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            if (selectedIndex == index) {
              selectedIndex = null;
              _controller.reverse();
            } else {
              selectedIndex = index;
              _controller.forward(from: 0.0);
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
              color: categories[index]["color"],
            ),
            const SizedBox(height: 8),
            Text(
              categories[index]["title"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptions(int index) {
    final options = categories[index]["options"] as List<dynamic>;
    return SizeTransition(
      sizeFactor: _heightFactor,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: categories[index]["color"],
            width: 1,
          ),
        ),
        child: Column(
          children: options
              .map((option) => ListTile(
                    dense: true,
                    title: Text(
                      option.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        color: categories[index]["color"],
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: categories[index]["color"],
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
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: (categories.length / 2).ceil(),
            itemBuilder: (context, rowIndex) {
              return Column(
                children: [
                  Row(
                    children: [
                      for (int i = rowIndex * 2; i < min((rowIndex + 1) * 2, categories.length); i++)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: i.isEven ? 0 : 8,
                              right: i.isEven ? 8 : 0,
                              bottom: 16,
                            ),
                            child: _buildCard(i, themeNotifier),
                          ),
                        ),
                    ],
                  ),
                  if (selectedIndex != null && selectedIndex! ~/ 2 == rowIndex) _buildOptions(selectedIndex!),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
