import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance/services/variables.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';
import 'package:tinycolor2/tinycolor2.dart';

class Tab2Content extends StatefulWidget {
  const Tab2Content({super.key});

  @override
  State<Tab2Content> createState() => _Tab2ContentState();
}

class _Tab2ContentState extends State<Tab2Content> with TickerProviderStateMixin {
  late List<Map<String, dynamic>> categories;
  late List<String> options;
  int? expandedIndex;
  late List<AnimationController> controllers;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    categories = [
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
    options = [
      "Seçenek 1",
      "Seçenek 2",
      "Seçenek 3",
      "Seçenek 4",
      "Seçenek 5",
    ];
    controllers = List.generate(
      categories.length,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      ),
    );

    // Sayfa açıldığında otomatik olarak text field'ı odakla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void onToggleExpansion(int? index) {
    setState(() {
      if (expandedIndex == index) {
        controllers[index!].reverse();
        expandedIndex = null;
      } else {
        if (expandedIndex != null) {
          controllers[expandedIndex!].reverse();
        }
        expandedIndex = index;
        controllers[index!].forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Scaffold(
          appBar: CupertinoNavigationBar(
            middle: Image.asset('assets/images/Arex-Branding-5.png'),
            backgroundColor: themeNotifier.primaryColor,
            leading: CupertinoNavigationBarBackButton(
              onPressed: () => Navigator.pop(context),
              color: textColor,
            ),
          ),
          body: Column(
            children: [
              Container(
                color: themeNotifier.primaryColor,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: CupertinoTextField(
                        focusNode: _searchFocusNode,
                        autofocus: true,
                        style: const TextStyle(color: Colors.white70),
                        controller: _searchController,
                        placeholder: 'Size nasıl yardımcı olabiliriz?',
                        placeholderStyle: const TextStyle(color: CupertinoColors.inactiveGray),
                        prefix: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(CupertinoIcons.search, color: CupertinoColors.inactiveGray),
                        ),
                        decoration: BoxDecoration(
                          color: themeNotifier.primaryColor.brighten(10),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8.0),
                  physics: const BouncingScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => onToggleExpansion(index),
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            elevation: 2.0,
                            child: ListTile(
                              leading: Icon(categories[index]['icon'], size: 40.0),
                              title: Text(categories[index]['title']),
                            ),
                          ),
                        ),
                        SizeTransition(
                          sizeFactor: controllers[index],
                          axisAlignment: -1.0,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: options.map((option) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Text(
                                      option,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
