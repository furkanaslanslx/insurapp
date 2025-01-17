import 'package:flutter/material.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class DamageAssistance extends StatefulWidget {
  const DamageAssistance({super.key});

  @override
  State<DamageAssistance> createState() => _DamageAssistanceState();
}

class _DamageAssistanceState extends State<DamageAssistance> {
  List<bool> isMovedList = [false, false, false, false, false, false];
  int? selectedIndex;

  List<Map<String, dynamic>> categories = [
    {"title": "Hasar Anında", "icon": Icons.warning, "color": Colors.deepPurpleAccent},
    {"title": "Hasar İhbarı", "icon": Icons.attach_money, "color": Colors.deepOrangeAccent},
    {"title": "Anlaşmalı Servisler", "icon": Icons.directions_car, "color": Colors.redAccent},
    {"title": "Anlaşmalı Sağlık Kurumları", "icon": Icons.business, "color": Colors.lightBlueAccent},
    {"title": "Anlaşmalı Servis Başvurusu", "icon": Icons.shopping_bag, "color": Colors.lightGreenAccent},
    {"title": "Tedarikçi Başvurusu", "icon": Icons.engineering, "color": Colors.amberAccent},
  ];

  @override
  Widget build(BuildContext context) {
    List<String> titles = categories.map((category) => category["title"] as String).toList();
    List<Color> colors = categories.map((category) => category["color"] as Color).toList();
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                isMovedList.length,
                (index) {
                  return GestureDetector(
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
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      margin: EdgeInsets.only(bottom: isMovedList[index] ? 10.0 : 0.0, right: 5.0, left: 10.0),
                      transform: Matrix4.translationValues(0, isMovedList[index] ? 10.0 : 0.0, 0),
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          // color: isMovedList[index] ? themeNotifier.primaryColor : themeNotifier.secondaryColor,
                          color: colors[index],
                          width: isMovedList[index] ? 5 : 2,
                        ),
                        // color: colors[index],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        titles[index],
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
