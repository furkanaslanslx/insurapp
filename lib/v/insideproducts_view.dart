import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance/services/variables.dart';
import 'package:insurance/v/webview_detail.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class InsideProductsView extends StatefulWidget {
  const InsideProductsView({super.key});

  @override
  State<InsideProductsView> createState() => _InsideProductsViewState();
}

class _InsideProductsViewState extends State<InsideProductsView> {
  List<Category> categories = [
    Category(
      title: 'ARAÇ',
      subItems: [
        {"title": "GENİŞLETİLMİŞ KASKO", "icon": CupertinoIcons.car},
      ],
    ),
    Category(
      title: 'İŞYERİ',
      subItems: [
        {"title": "İŞYERİ PAKET SİGORTASI", "icon": CupertinoIcons.briefcase},
        {"title": "KUYUMCU PAKET SİGORTASI", "icon": CupertinoIcons.circle_filled},
      ],
    ),
    Category(
      title: 'ÖZEL ÜRÜNLER',
      subItems: [
        {"title": "AREX KOLEKSİYON ESERLERİ SİGORTASI", "icon": CupertinoIcons.collections},
        {"title": "SİBER GÜVENLİK SİGORTASI", "icon": CupertinoIcons.lock_shield},
        {"title": "KLİNİK DENEYLER SORUMLULUK SİGORTASI", "icon": CupertinoIcons.heart},
      ],
    ),
    Category(
      title: 'MÜHENDİSLİK',
      subItems: [
        {"title": "İNŞAAT ALL-RİSK SİGORTASI", "icon": CupertinoIcons.hammer},
        {"title": "ELEKTRONİK CİHAZ SİGORTASI", "icon": CupertinoIcons.device_laptop},
        {"title": "MAKİNE KIRILMA SİGORTASI", "icon": CupertinoIcons.gear_alt_fill},
        {"title": "MONTAJ ALL RISK SİGORTASI", "icon": CupertinoIcons.wrench_fill},
      ],
    ),
    Category(
      title: 'FERDİ KAZA',
      subItems: [
        {"title": "BİREYSEL FERDİ KAZA SİGORTASI", "icon": CupertinoIcons.person},
        {"title": "GRUP FERDİ KAZA SİGORTASI", "icon": CupertinoIcons.group},
        {"title": "MADEN ÇALIŞANLARI ZORUNLU FERDİ KAZA SİGORTASI", "icon": CupertinoIcons.person_2_square_stack},
      ],
    ),
    Category(
      title: 'FİNANS',
      subItems: [
        {"title": "KEFALET SİGORTASI", "icon": CupertinoIcons.check_mark_circled},
        {"title": "DEPOZİTOM GÜVENDE KEFALET SENEDİ", "icon": CupertinoIcons.money_dollar_circle},
        {"title": "BİNA TAMAMLAMA SİGORTASI", "icon": CupertinoIcons.house_alt_fill},
      ],
    ),
    Category(
      title: 'SAĞLIK',
      subItems: [
        {"title": "YABANCI SAĞLIK SİGORTASI", "icon": CupertinoIcons.heart_fill},
        {"title": "YURT DIŞI SEYAHAT SAĞLIK SİGORTASI", "icon": CupertinoIcons.airplane},
        {"title": "YURT DIŞI EĞİTİM SEYAHAT SİGORTASI", "icon": CupertinoIcons.book},
        {"title": "YURT DIŞI ÇALIŞMA SEYAHAT SİGORTASI", "icon": CupertinoIcons.briefcase_fill},
      ],
    ),
    Category(
      title: 'KONUT',
      subItems: [
        {"title": "KONUT PAKET SİGORTASI", "icon": CupertinoIcons.house},
        {"title": "ZORUNLU DEPREM SİGORTASI", "icon": CupertinoIcons.building_2_fill},
      ],
    ),
    Category(
      title: 'SORUMLULUK',
      subItems: [
        {"title": "İŞVEREN MALİ SORUMLULUK SİGORTASI", "icon": CupertinoIcons.chart_pie},
        {"title": "MESLEKİ MALİ SORUMLULUK SİGORTASI", "icon": CupertinoIcons.creditcard},
        {"title": "ÜÇÜNCÜ ŞAHIS MALİ SORUMLULUK SİGORTASI", "icon": CupertinoIcons.group},
        {"title": "ÜRÜN SORUMLULUK SİGORTASI", "icon": CupertinoIcons.cube_box},
      ],
    ),
    Category(
      title: 'NAKLİYAT',
      subItems: [
        {"title": "EMTEA SİGORTASI", "icon": CupertinoIcons.cart_fill},
        {"title": "TAŞIYICI SORUMLULUK SİGORTASI", "icon": CupertinoIcons.bus},
        {"title": "YAT SİGORTASI", "icon": CupertinoIcons.wind},
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Scaffold(
          // backgroundColor: textColor,
          appBar: CupertinoNavigationBar(
            // centerTitle: true,
            middle: const Text('Sigorta Ürünleri', style: TextStyle(color: textColor)),
            backgroundColor: themeNotifier.primaryColor,
            // foregroundColor: textColor,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < categories.length; i++) ...[
                  CategoryWidget(category: categories[i], themeNotifier: themeNotifier),
                  // if (i < categories.length - 1) Divider(height: 5, color: themeNotifier.primaryColor),
                ],
                SizedBox(height: navigationHeight),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Category {
  String title;
  List<Map<String, dynamic>> subItems;
  bool isExpanded;

  Category({
    required this.title,
    required this.subItems,
    this.isExpanded = false,
  });
}

class CategoryWidget extends StatefulWidget {
  final Category category;
  final ThemeNotifier themeNotifier;

  const CategoryWidget({super.key, required this.category, required this.themeNotifier});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> with SingleTickerProviderStateMixin {
  late bool isExpanded;
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    isExpanded = widget.category.isExpanded;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    if (isExpanded) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
      if (isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: toggleExpand,
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: Card(
              color: Colors.white,
              elevation: 2,
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.category.title,
                  style: TextStyle(
                    color: widget.themeNotifier.primaryColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _animation,
          axisAlignment: 0.0,
          child: ListView.builder(
            shrinkWrap: true, // İçeriğe göre boyutlandır
            physics: const NeverScrollableScrollPhysics(), // İç kaydırmayı devre dışı bırak
            itemCount: widget.category.subItems.length,
            itemBuilder: (context, index) {
              final subItem = widget.category.subItems[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebviewDetail(pageTitle: subItem["title"]),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  margin: const EdgeInsets.only(left: 32, right: 32, bottom: 8.0),
                  decoration: BoxDecoration(
                    color: widget.themeNotifier.secondaryColor,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        subItem["icon"], // İlgili ikon
                        color: widget.themeNotifier.primaryColor,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          subItem["title"], // Alt öğenin başlığı
                          style: TextStyle(
                            fontSize: 16.0,
                            color: widget.themeNotifier.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: widget.themeNotifier.primaryColor,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
