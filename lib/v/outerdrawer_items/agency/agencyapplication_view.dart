import 'package:flutter/material.dart';
import 'package:insurance/v/outerdrawer_items/agency/first.dart';
import 'package:insurance/v/outerdrawer_items/agency/second.dart';
import 'package:insurance/v/wdgts/mylisttile_wdgt.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class AgencyapplicationView extends StatelessWidget {
  const AgencyapplicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return Scaffold(
        backgroundColor: themeNotifier.primaryColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Acente'),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0x00000000),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: kToolbarHeight + MediaQuery.paddingOf(context).top - 4,
              ),
              MylisttileWdgt(
                textColor: themeNotifier.primaryColor,
                backgroundColor: themeNotifier.secondaryColor,
                leading: const Icon(Icons.business),
                title: 'ACENTELİK BAŞVURUSU',
                subtitle: 'Detaylı bilgi için tıklayınız',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LastAgencyApplication()));
                },
              ),
              MylisttileWdgt(
                textColor: themeNotifier.primaryColor,
                backgroundColor: themeNotifier.secondaryColor,
                leading: const Icon(Icons.location_on),
                title: 'EN YAKIN ACENTE',
                subtitle: 'Konum bilgisi için tıklayınız',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ClosestLocationView()));
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
