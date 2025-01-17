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
      subItems: ['GENİŞLETİLMİŞ KASKO'],
    ),
    Category(
      title: 'İŞYERİ',
      subItems: ['İŞYERİ PAKET SİGORTASI', 'KUYUMCU PAKET SİGORTASI'],
    ),
    Category(
      title: 'ÖZEL ÜRÜNLER',
      subItems: [
        'AREX KOLEKSİYON ESERLERİ SİGORTASI',
        'SİBER GÜVENLİK SİGORTASI',
        'KLİNİK DENEYLER SORUMLULUK SİGORTASI',
      ],
    ),
    Category(
      title: 'MÜHENDİSLİK',
      subItems: [
        'İNŞAAT ALL-RİSK SİGORTASI',
        'ELEKTRONİK CİHAZ SİGORTASI',
        'MAKİNE KIRILMA SİGORTASI',
        'MONTAJ ALL RISK SİGORTASI',
      ],
    ),
    Category(
      title: 'FERDİ KAZA',
      subItems: [
        'BİREYSEL FERDİ KAZA SİGORTASI',
        'GRUP FERDİ KAZA SİGORTASI',
        'MADEN ÇALIŞANLARI ZORUNLU FERDİ KAZA SİGORTASI',
      ],
    ),
    Category(
      title: 'FİNANS',
      subItems: [
        'KEFALET SİGORTASI',
        'DEPOZİTOM GÜVENDE KEFALET SENEDİ',
        'BİNA TAMAMLAMA SİGORTASI',
      ],
    ),
    Category(
      title: 'SAĞLIK',
      subItems: [
        'YABANCI SAĞLIK SİGORTASI',
        'YURT DIŞI SEYAHAT SAĞLIK SİGORTASI',
        'YURT DIŞI EĞİTİM SEYAHAT SİGORTASI',
        'YURT DIŞI ÇALIŞMA SEYAHAT SİGORTASI',
      ],
    ),
    Category(
      title: 'KONUT',
      subItems: ['KONUT PAKET SİGORTASI', 'ZORUNLU DEPREM SİGORTASI'],
    ),
    Category(
      title: 'SORUMLULUK',
      subItems: [
        'İŞVEREN MALİ SORUMLULUK SİGORTASI',
        'MESLEKİ MALİ SORUMLULUK SİGORTASI',
        'ÜÇÜNCÜ ŞAHIS MALİ SORUMLULUK SİGORTASI',
        'ÜRÜN SORUMLULUK SİGORTASI',
      ],
    ),
    Category(
      title: 'NAKLİYAT',
      subItems: [
        'EMTEA SİGORTASI',
        'TAŞIYICI SORUMLULUK SİGORTASI',
        'YAT SİGORTASI',
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
  List<String> subItems;
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
          child: Column(
            children: widget.category.subItems.map(
              (subItem) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WebviewDetail(pageTitle: subItem)));
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    margin: const EdgeInsets.only(left: 32, right: 32, bottom: 8.0),
                    decoration: BoxDecoration(
                      color: widget.themeNotifier.secondaryColor,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            subItem,
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
            ).toList(),
          ),
        ),
      ],
    );
  }
}
