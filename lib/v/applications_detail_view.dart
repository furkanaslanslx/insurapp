import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class ApplicationsDetailView extends StatefulWidget {
  final int index;
  const ApplicationsDetailView({super.key, required this.index});

  @override
  State<ApplicationsDetailView> createState() => _ApplicationsDetailViewState();
}

class _ApplicationsDetailViewState extends State<ApplicationsDetailView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return Scaffold(
          appBar: CupertinoNavigationBar(
            padding: const EdgeInsetsDirectional.only(start: 0),
            middle: const Text('Başvuru Detayı', style: TextStyle(color: Colors.white)),
            backgroundColor: themeNotifier.primaryColor,
            leading: CupertinoNavigationBarBackButton(
              color: Colors.blue,
              previousPageTitle: 'Geri',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: (() {
              switch (widget.index) {
                case 0:
                  return Application1(themeNotifier: themeNotifier);
                case 1:
                  return Application2(themeNotifier: themeNotifier);
                case 2:
                  return Application3(themeNotifier: themeNotifier);
                // case 3:
                //   return const Application();
                // case 4:
                //   return const Application();
                // default:
                //   return const Application();
              }
            }()),
          ),
        );
      },
    );
  }
}

class Application1 extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  const Application1({super.key, required this.themeNotifier});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.person, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('İsim: Furkan,   Soyisim: Aslan', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.cake, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Yaş: 24,   Cinsiyet: Erkek', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.work, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Meslek: Mühendis,   Sigorta Türü: Kasko', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.location_on, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Adres: Bursa, Türkiye', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.phone, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Telefon: 0555 555 55 55', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Divider(height: 20, thickness: 2, color: themeNotifier.primaryColor),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.calendar_today, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Sigorta Başlangıç Tarihi: 01.01.2022,\nSigorta Bitiş Tarihi: 01.01.2023', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.attach_money, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Sigorta Bedeli: 1000 TL,   \nSigorta Prim Tutarı: 100 TL', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.business, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Sigorta Acentesi: Arex Sigorta Acentesi', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.phone, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Sigorta Acentesi Telefon: 0555 555 55 55', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.location_on, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Sigorta Acentesi Adres: İstanbul, Türkiye', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 70),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Durum Sorgula'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Başvuruyu İptal Et'),
            ),
          ],
        ),
      ],
    );
  }
}

class Application2 extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  const Application2({super.key, required this.themeNotifier});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.person, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('İsim: Ahmet,   Soyisim: Yılmaz', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.cake, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Yaş: 30,   Cinsiyet: Erkek', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.work, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Meslek: Doktor,   Sigorta Türü: Sağlık', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.location_on, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Adres: Ankara, Türkiye', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.phone, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Telefon: 0544 444 44 44', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Divider(height: 20, thickness: 2, color: themeNotifier.primaryColor),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.calendar_today, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Sigorta Başlangıç Tarihi: 01.02.2022,\nSigorta Bitiş Tarihi: 01.02.2023', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.attach_money, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Sigorta Bedeli: 2000 TL,   \nSigorta Prim Tutarı: 200 TL', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.business, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Sigorta Acentesi: Beta Sigorta Acentesi', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.phone, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Sigorta Acentesi Telefon: 0544 444 44 44', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.location_on, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Sigorta Acentesi Adres: Ankara, Türkiye', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 70),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Durum Sorgula'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Başvuruyu İptal Et'),
            ),
          ],
        ),
      ],
    );
  }
}

class Application3 extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  const Application3({super.key, required this.themeNotifier});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.person, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('İsim: Ayşe,   Soyisim: Demir', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.cake, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Yaş: 28,   Cinsiyet: Kadın', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.work, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Meslek: Öğretmen,   Sigorta Türü: Hayat', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.location_on, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Adres: İzmir, Türkiye', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.phone, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Telefon: 0533 333 33 33', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Divider(height: 20, thickness: 2, color: themeNotifier.primaryColor),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.calendar_today, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Sigorta Başlangıç Tarihi: 01.03.2022,\nSigorta Bitiş Tarihi: 01.03.2023', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.attach_money, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Sigorta Bedeli: 3000 TL,   \nSigorta Prim Tutarı: 300 TL', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.business, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Sigorta Acentesi: Gamma Sigorta Acentesi', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.phone, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Sigorta Acentesi Telefon: 0533 333 33 33', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.location_on, color: themeNotifier.primaryColor),
                const SizedBox(width: 10),
                const Text('Sigorta Acentesi Adres: İzmir, Türkiye', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 70),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Durum Sorgula'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Başvuruyu İptal Et'),
            ),
          ],
        ),
      ],
    );
  }
}
