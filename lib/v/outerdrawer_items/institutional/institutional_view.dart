import 'package:flutter/material.dart';
import 'package:insurance/v/wdgts/mylisttile_wdgt.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class InstitutionalView extends StatelessWidget {
  const InstitutionalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return Scaffold(
        backgroundColor: themeNotifier.primaryColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'Kurumsal',
            style: TextStyle(color: Colors.white),
          ),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0x00000000),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: kToolbarHeight + MediaQuery.paddingOf(context).top - 20,
                ),
                MylisttileWdgt(
                  leading: const Icon(Icons.business),
                  title: 'Kurumsal Yapı',
                  subtitle: 'Kurumsal bilgiler hakkında detaylar',
                  onTap: () {},
                  textColor: themeNotifier.primaryColor,
                  backgroundColor: themeNotifier.secondaryColor,
                ),
                MylisttileWdgt(
                  leading: const Icon(Icons.group),
                  title: 'Yönetim Kurulu',
                  subtitle: 'Şirket yönetim kurulu üyeleri',
                  onTap: () {},
                  textColor: themeNotifier.primaryColor,
                  backgroundColor: themeNotifier.secondaryColor,
                ),
                MylisttileWdgt(
                  leading: const Icon(Icons.account_tree),
                  title: 'Organizasyon Yapısı',
                  subtitle: 'Organizasyon şeması',
                  onTap: () {},
                  textColor: themeNotifier.primaryColor,
                  backgroundColor: themeNotifier.secondaryColor,
                ),
                MylisttileWdgt(
                  leading: const Icon(Icons.gavel),
                  title: 'Yasal Bilgilendirmeler',
                  subtitle: 'Yasal uyarılar ve bilgiler',
                  onTap: () {},
                  textColor: themeNotifier.primaryColor,
                  backgroundColor: themeNotifier.secondaryColor,
                ),
                MylisttileWdgt(
                  leading: const Icon(Icons.info),
                  title: 'Şirket Genel Bilgileri',
                  subtitle: 'Genel şirket bilgileri',
                  onTap: () {},
                  textColor: themeNotifier.primaryColor,
                  backgroundColor: themeNotifier.secondaryColor,
                ),
                MylisttileWdgt(
                  leading: const Icon(Icons.attach_money),
                  title: 'Finansal Bilgiler',
                  subtitle: 'Şirketin finansal bilgileri',
                  onTap: () {},
                  textColor: themeNotifier.primaryColor,
                  backgroundColor: themeNotifier.secondaryColor,
                ),
                MylisttileWdgt(
                  leading: const Icon(Icons.pie_chart),
                  title: 'Sermaye Yapısı',
                  subtitle: 'Şirketin sermaye yapısı',
                  onTap: () {},
                  textColor: themeNotifier.primaryColor,
                  backgroundColor: themeNotifier.secondaryColor,
                ),
                MylisttileWdgt(
                  leading: const Icon(Icons.photo_library),
                  title: 'Foto Galeri',
                  subtitle: 'Şirket fotoğrafları',
                  onTap: () {},
                  textColor: themeNotifier.primaryColor,
                  backgroundColor: themeNotifier.secondaryColor,
                ),
                MylisttileWdgt(
                  leading: const Icon(Icons.contact_page),
                  title: 'İletişim',
                  subtitle: 'İletişim bilgileri',
                  onTap: () {},
                  textColor: themeNotifier.primaryColor,
                  backgroundColor: themeNotifier.secondaryColor,
                ),
                MylisttileWdgt(
                  leading: const Icon(Icons.book),
                  title: 'Kurumsal Yönetim İlkeleri Raporu',
                  subtitle: 'Kurumsal yönetim ilkeleri',
                  onTap: () {},
                  textColor: themeNotifier.primaryColor,
                  backgroundColor: themeNotifier.secondaryColor,
                ),
                MylisttileWdgt(
                  leading: const Icon(Icons.bar_chart),
                  title: 'Performans Raporları',
                  subtitle: 'Şirket performans raporları',
                  onTap: () {},
                  textColor: themeNotifier.primaryColor,
                  backgroundColor: themeNotifier.secondaryColor,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
