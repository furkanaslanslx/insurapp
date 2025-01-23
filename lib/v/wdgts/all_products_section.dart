import 'package:flutter/cupertino.dart';
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
    {"title": "Araç", "icon": CupertinoIcons.car},
    {"title": "İşyeri", "icon": CupertinoIcons.briefcase},
    {"title": "Özel Ürünler", "icon": CupertinoIcons.bag_fill},
    {"title": "Mühendislik", "icon": CupertinoIcons.hammer},
    {"title": "Ferdi Kaza", "icon": CupertinoIcons.person_crop_circle_badge_exclam},
    {"title": "Finansal Sigortalar", "icon": CupertinoIcons.money_dollar_circle},
    {"title": "Sağlık", "icon": CupertinoIcons.heart_fill},
    {"title": "Konut", "icon": CupertinoIcons.house_fill},
    {"title": "Sorumluluk", "icon": CupertinoIcons.shield_fill},
    {"title": "Nakliyat", "icon": CupertinoIcons.cart_fill},
  ];

  List<List<Map<String, dynamic>>> optionsWithIcons = [
    [
      {"title": "GENİŞLETİLMİŞ KASKO", "icon": CupertinoIcons.car},
    ],
    [
      {"title": "İŞYERİ PAKET SİGORTASI", "icon": CupertinoIcons.briefcase},
      {"title": "KUYUMCU PAKET SİGORTASI", "icon": CupertinoIcons.circle_filled},
    ],
    [
      {"title": "AREX KOLEKSİYON ESERLERİ SİGORTASI", "icon": CupertinoIcons.collections},
      {"title": "SİBER GÜVENLİK SİGORTASI", "icon": CupertinoIcons.lock_shield},
      {"title": "KLİNİK DENEYLER SORUMLULUK SİGORTASI", "icon": CupertinoIcons.heart},
    ],
    [
      {"title": "İNŞAAT ALL-RİSK SİGORTASI", "icon": CupertinoIcons.hammer},
      {"title": "ELEKTRONİK CİHAZ SİGORTASI", "icon": CupertinoIcons.device_laptop},
      {"title": "MAKİNE KIRILMA SİGORTASI", "icon": CupertinoIcons.gear_alt_fill},
      {"title": "MONTAJ ALL RISK SİGORTASI", "icon": CupertinoIcons.wrench_fill},
    ],
    [
      {"title": "BİREYSEL FERDİ KAZA SİGORTASI", "icon": CupertinoIcons.person},
      {"title": "GRUP FERDİ KAZA SİGORTASI", "icon": CupertinoIcons.group},
      {"title": "MADEN ÇALIŞANLARI ZORUNLU FERDİ KAZA SİGORTASI", "icon": CupertinoIcons.person_2_square_stack},
    ],
    [
      {"title": "KEFALET SİGORTASI", "icon": CupertinoIcons.check_mark_circled},
      {"title": "DEPOZİTOM GÜVENDE KEFALET SENEDİ", "icon": CupertinoIcons.money_dollar_circle},
      {"title": "BİNA TAMAMLAMA SİGORTASI", "icon": CupertinoIcons.house_alt_fill},
    ],
    [
      {"title": "YABANCI SAĞLIK SİGORTASI", "icon": CupertinoIcons.heart_fill},
      {"title": "YURT DIŞI SEYAHAT SAĞLIK SİGORTASI", "icon": CupertinoIcons.airplane},
      {"title": "YURT DIŞI EĞİTİM SEYAHAT SİGORTASI", "icon": CupertinoIcons.book},
      {"title": "YURT DIŞI ÇALIŞMA SEYAHAT SİGORTASI", "icon": CupertinoIcons.briefcase_fill},
    ],
    [
      {"title": "KONUT PAKET SİGORTASI", "icon": CupertinoIcons.house},
      {"title": "ZORUNLU DEPREM SİGORTASI", "icon": CupertinoIcons.building_2_fill},
    ],
    [
      {"title": "İŞVEREN MALİ SORUMLULUK SİGORTASI", "icon": CupertinoIcons.chart_pie},
      {"title": "MESLEKİ MALİ SORUMLULUK SİGORTASI", "icon": CupertinoIcons.creditcard},
      {"title": "ÜÇÜNCÜ ŞAHIS MALİ SORUMLULUK SİGORTASI", "icon": CupertinoIcons.group},
      {"title": "ÜRÜN SORUMLULUK SİGORTASI", "icon": CupertinoIcons.cube_box},
    ],
    [
      {"title": "EMTEA SİGORTASI", "icon": CupertinoIcons.cart_fill},
      {"title": "TAŞIYICI SORUMLULUK SİGORTASI", "icon": CupertinoIcons.bus},
      {"title": "YAT SİGORTASI", "icon": CupertinoIcons.wind},
    ],
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    List<String> titles = categories.map((category) => category["title"] as String).toList();
    List<IconData> icons = categories.map((category) => category["icon"] as IconData).toList();
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
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
                        margin: EdgeInsets.only(bottom: isMovedList[index] ? 20.0 : 10.0, right: .0, left: 24.0),
                        transform: Matrix4.translationValues(0, isMovedList[index] ? 10.0 : 0.0, 0),
                        width: 180,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: isMovedList[index] ? themeNotifier.primaryColor : themeNotifier.secondaryColor, width: isMovedList[index] ? 3 : 2),
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(icons[index]),
                            const SizedBox(width: 8.0),
                            Text(
                              titles[index],
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
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
              height: selectedIndex != null
                  ? optionsWithIcons[selectedIndex!].length * 38.0 // Her öğenin yüksekliği 40
                  : 0, // Liste yoksa yükseklik 0
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: themeNotifier.secondaryColor.darken(40),
                  width: 1,
                ),
              ),
              child: selectedIndex != null
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: optionsWithIcons[selectedIndex!].length,
                      physics: const NeverScrollableScrollPhysics(), // İç kaydırmayı devre dışı bırak
                      itemBuilder: (context, index) {
                        final item = optionsWithIcons[selectedIndex!][index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7.5),
                          child: Row(
                            children: [
                              Icon(
                                item["icon"],
                                color: themeNotifier.primaryColor.brighten(10),
                                size: 20,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  item["title"],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: themeNotifier.primaryColor.brighten(10),
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : null,
            ),
          ],
        );
      },
    );
  }
}
