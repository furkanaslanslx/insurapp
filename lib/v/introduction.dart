import 'package:flutter/material.dart';
import 'package:insurance/v/outerdrawer_view.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return IntroductionScreen(
        pages: listPagesViewModel(themeNotifier),
        showSkipButton: true,
        skip: Icon(Icons.skip_next, color: themeNotifier.secondaryColor),
        next: Text("İleri", style: TextStyle(color: themeNotifier.secondaryColor)),
        done: Text("Tamamla", style: TextStyle(fontWeight: FontWeight.w700, color: themeNotifier.secondaryColor)),
        onDone: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const OuterDrawerView()), (route) => false);
        },
        onSkip: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const OuterDrawerView()), (route) => false);
        },
        globalBackgroundColor: themeNotifier.primaryColor,
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: themeNotifier.secondaryColor,
          color: themeNotifier.secondaryColor.withValues(alpha: 0.2),
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      );
    });
  }
}

List<PageViewModel> listPagesViewModel(ThemeNotifier themeNotifier) {
  return [
    PageViewModel(
      useScrollView: false,
      title: "Kefalet Sigortası",
      body: "Finansal süreçlerinizde güven veren akılcı çözüm! AREX Kefalet Sigortası",
      image: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset("assets/opening/1stpicture.png", height: 300.0),
        ),
      ),
      decoration: PageDecoration(
        pageColor: themeNotifier.primaryColor,
        bodyTextStyle: TextStyle(color: themeNotifier.secondaryColor),
        titleTextStyle: TextStyle(color: themeNotifier.secondaryColor, fontSize: 22.0),
        imageFlex: 3,
        bodyFlex: 2,
      ),
    ),
    PageViewModel(
      useScrollView: false,
      title: "Kuyumcu Paket Sigortası",
      body: "Kuyumcu paket için; İşyerinizdeki değerli mücevherler, taşlar ve saatler AREX Sigorta ile güvence altında!",
      image: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset("assets/opening/2ndpicture.png", height: 300.0),
        ),
      ),
      decoration: PageDecoration(
        pageColor: themeNotifier.primaryColor,
        bodyTextStyle: TextStyle(color: themeNotifier.secondaryColor),
        titleTextStyle: TextStyle(color: themeNotifier.secondaryColor, fontSize: 22.0),
        imageFlex: 3,
        bodyFlex: 2,
      ),
    ),
    PageViewModel(
      useScrollView: false,
      title: "Klinik Deneyler Sorumluluk Sigortası",
      body: "Klinik deney çalışmalarna katılan gönüllülerin karşılaşabileceği riskleri güvence altina alan AREX Klinik Araştırmalar Sorumluluk Sigortası.",
      image: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset("assets/opening/3rdpicture.png", height: 300.0),
        ),
      ),
      decoration: PageDecoration(
        pageColor: themeNotifier.primaryColor,
        bodyTextStyle: TextStyle(color: themeNotifier.secondaryColor),
        titleTextStyle: TextStyle(color: themeNotifier.secondaryColor, fontSize: 22.0),
        imageFlex: 3,
        bodyFlex: 2,
      ),
    ),
  ];
}
// final List<PageViewModel> listPagesViewModel = [
//   PageViewModel(
//     title: "Title of first page",
//     body: "Here you can write the description of the page, to explain something...",
//     image: Center(
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16.0),
//         child: Image.asset("assets/opening/1stpicture.png", height: 300.0),
//       ),
//     ),
//     decoration: const PageDecoration(
//       pageColor: Colors.white,
//       bodyTextStyle: TextStyle(color: Colors.black),
//       titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0),
//       imageFlex: 3,
//     ),
//   ),
//   PageViewModel(
//     title: "Title of second page",
//     body: "Here you can write the description of the page, to explain something...",
//     image: Center(
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16.0),
//         child: Image.asset("assets/opening/2ndpicture.png", height: 300.0),
//       ),
//     ),
//     decoration: const PageDecoration(
//       pageColor: Colors.white,
//       bodyTextStyle: TextStyle(color: Colors.black),
//       titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0),
//       imageFlex: 3,
//     ),
//   ),
//   PageViewModel(
//     title: "Title of third page",
//     body: "Here you can write the description of the page, to explain something...",
//     image: Center(
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16.0),
//         child: Image.asset("assets/opening/3rdpicture.png", height: 300.0),
//       ),
//     ),
//     decoration: const PageDecoration(
//       pageColor: Colors.white,
//       bodyTextStyle: TextStyle(color: Colors.black),
//       titleTextStyle: TextStyle(color: Colors.black, fontSize: 22.0),
//       imageFlex: 3,
//     ),
//   ),
// ];
