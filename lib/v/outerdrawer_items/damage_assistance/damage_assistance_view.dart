import 'package:flutter/material.dart';
import 'package:insurance/services/variables.dart';
import 'package:insurance/v/wdgts/mylisttile_wdgt.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class DamageAssistanceView extends StatelessWidget {
  const DamageAssistanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: themeNotifier.primaryColor,
        appBar: AppBar(
          title: const Text('Hasar Yardım'),
          backgroundColor: Colors.transparent,
          foregroundColor: textColor,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: MediaQuery.paddingOf(context).top - 20,
            ),
            MylisttileWdgt(
              leading: const Icon(Icons.handshake),
              title: 'ANLAŞMALI SERVİSLER',
              subtitle: 'Anlaşmalı servisler hakkında bilgi alabilirsiniz.',
              onTap: () {
                // ANLAŞMALI SERVİSLER'e tıklandığında yapılacak işlemler
              },
              textColor: themeNotifier.primaryColor,
              backgroundColor: themeNotifier.secondaryColor,
            ),
            MylisttileWdgt(
              leading: const Icon(Icons.local_hospital),
              title: 'ANLAŞMALI SAĞLIK KURUMLARI',
              subtitle: 'Anlaşmalı sağlık kurumları listesi.',
              onTap: () {
                // ANLAŞMALI SAĞLIK KURUMLARI'na tıklandığında yapılacak işlemler
              },
              textColor: themeNotifier.primaryColor,
              backgroundColor: themeNotifier.secondaryColor,
            ),
            MylisttileWdgt(
              leading: const Icon(Icons.assignment),
              title: 'ANLAŞMALI SERVİS BAŞVURUSU',
              subtitle: 'Servis başvurusu yapabilirsiniz.',
              onTap: () {
                // ANLAŞMALI SERVİS BAŞVURUSU'na tıklandığında yapılacak işlemler
              },
              textColor: themeNotifier.primaryColor,
              backgroundColor: themeNotifier.secondaryColor,
            ),
            MylisttileWdgt(
              leading: const Icon(Icons.store),
              title: 'TEDARİKÇİ BAŞVURUSU',
              subtitle: 'Tedarikçi olarak başvurunuzu gerçekleştirin.',
              onTap: () {
                // TEDARİKÇİ BAŞVURUSU'na tıklandığında yapılacak işlemler
              },
              textColor: themeNotifier.primaryColor,
              backgroundColor: themeNotifier.secondaryColor,
            ),
            MylisttileWdgt(
              leading: const Icon(Icons.report_problem),
              title: 'HASAR ANINDA',
              subtitle: 'Hasar anında yapılması gerekenler.',
              onTap: () {
                // HASAR ANINDA'ya tıklandığında yapılacak işlemler
              },
              textColor: themeNotifier.primaryColor,
              backgroundColor: themeNotifier.secondaryColor,
            ),
            MylisttileWdgt(
              leading: const Icon(Icons.warning),
              title: 'HASAR İHBARI',
              subtitle: 'Hasar ihbarı oluşturun.',
              onTap: () {
                // HASAR İHBARI'na tıklandığında yapılacak işlemler
              },
              textColor: themeNotifier.primaryColor,
              backgroundColor: themeNotifier.secondaryColor,
            ),
          ],
        ),
      );
    });
  }
}
