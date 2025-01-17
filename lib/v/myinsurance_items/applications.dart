import 'package:flutter/material.dart';
import 'package:insurance/services/responsive.dart';
import 'package:insurance/v/applications_detail_view.dart';
import 'package:insurance/v/wdgts/mylisttile_wdgt.dart';
import 'package:insurance/v/wdgts/navigatoin_wdgt.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class Applications extends StatefulWidget {
  const Applications({super.key});

  @override
  State<Applications> createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {
  final ResponsiveSize _size = ResponsiveSize();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () async {
              NavigatoinWdgt.navigatorKey.currentState?.navigateToPage(2, data: '');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(10.0),
              height: _size.getWidth(context, 80),
              width: _size.getWidth(context, 450),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Yeni Başvuru'),
                  Icon(Icons.add),
                ],
              ),
            ),
          ),
          Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return MylisttileWdgt(
                  title: 'Başvuru $index',
                  subtitle: 'Başvuru ayrıntısına bakın',
                  backgroundColor: themeNotifier.primaryColor,
                  textColor: Colors.white,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicationsDetailView(index: index)));
                  },
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
