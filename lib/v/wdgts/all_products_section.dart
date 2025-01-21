import 'package:flutter/material.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';
import 'package:tinycolor2/tinycolor2.dart';

class AllProductsSection extends StatefulWidget {
  const AllProductsSection({super.key});

  @override
  State<AllProductsSection> createState() => _AllProductsSectionState();
}

class _AllProductsSectionState extends State<AllProductsSection> {
  List<bool> isMovedList = [false, false, false, false, false, false, false, false, false, false];

  List<Map<String, dynamic>> categories = [
    {"title": "Araç", "icon": Icons.directions_car},
    {"title": "İşyeri", "icon": Icons.business},
    {"title": "Özel Ürünler", "icon": Icons.shopping_bag},
    {"title": "Mühendislik", "icon": Icons.engineering},
    {"title": "Ferdi Kaza", "icon": Icons.warning},
    {"title": "Finansal Sigortalar", "icon": Icons.attach_money},
    {"title": "Sağlık", "icon": Icons.local_hospital},
    {"title": "Konut", "icon": Icons.home},
    {"title": "Sorumluluk", "icon": Icons.shield},
    {"title": "Nakliyat", "icon": Icons.local_shipping},
  ];

  List<List<String>> options = [
    ['Option 1A', 'Option 1B', 'Option 1C'],
    ['Option 2A', 'Option 2B', 'Option 2C'],
    ['Option 3A', 'Option 3B', 'Option 3C'],
    ['Option 4A', 'Option 4B', 'Option 4C'],
    ['Option 5A', 'Option 5B', 'Option 5C'],
    ['Option 6A', 'Option 6B', 'Option 6C'],
    ['Option 7A', 'Option 7B', 'Option 7C'],
    ['Option 8A', 'Option 8B', 'Option 8C'],
    ['Option 9A', 'Option 9B', 'Option 9C'],
    ['Option 10A', 'Option 10B', 'Option 10C'],
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    List<String> titles = categories.map((category) => category["title"] as String).toList();
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Tüm Ürünler",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: themeNotifier.primaryColor),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
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
                        margin: EdgeInsets.only(bottom: isMovedList[index] ? 20.0 : 10.0, right: 5.0, left: 10.0),
                        transform: Matrix4.translationValues(0, isMovedList[index] ? 10.0 : 0.0, 0),
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: isMovedList[index] ? themeNotifier.primaryColor : themeNotifier.secondaryColor, width: isMovedList[index] ? 5 : 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
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
            // const SizedBox(height: 10),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              width: MediaQuery.of(context).size.width,
              height: selectedIndex != null ? 150 : 0,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: themeNotifier.secondaryColor.darken(40), width: 1),
              ),
              child: selectedIndex != null
                  ? ListView(
                      children: options[selectedIndex!]
                          .map((option) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  option,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: themeNotifier.primaryColor.brighten(10),
                                  ),
                                ),
                              ))
                          .toList(),
                    )
                  : null,
            ),
          ],
        );
      },
    );
  }
}
