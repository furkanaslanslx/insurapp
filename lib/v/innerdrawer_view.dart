import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:insurance/main.dart';
import 'package:insurance/services/responsive.dart';
import 'package:insurance/v/qr_scanner_view.dart';
import 'package:insurance/v/wdgts/navigatoin_wdgt.dart';
import 'package:insurance/services/variables.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class InnerDrawerView extends GetView<MyInnerDrawerController> {
  const InnerDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyInnerDrawerController>(
      builder: (_) => Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return ZoomDrawer(
            controller: innerDrawerController,
            style: DrawerStyle.defaultStyle,
            menuScreen: InnerMenuScreen(),
            mainScreen: NavigatoinWdgt(),
            borderRadius: 24.0,
            showShadow: true,
            angle: 0.0,
            slideWidth: MediaQuery.of(context).size.width * 0.7,
            menuBackgroundColor: themeNotifier.primaryColor,
            duration: const Duration(milliseconds: 350),
            mainScreenScale: 0.2,
          );
        },
      ),
    );
  }
}

class InnerMenuScreen extends GetView<MyInnerDrawerController> {
  InnerMenuScreen({super.key});
  final ResponsiveSize _size = ResponsiveSize();
  final List<String> _list = [
    'InsurApp',
    'Diğer1',
    'Diğer2',
    'Diğer3',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return Material(
        color: themeNotifier.secondaryColor,
        child: Container(
          color: themeNotifier.primaryColor,
          height: _size.getHeight(context, 1334),
          width: _size.getWidth(context, 750),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _size.getWidth(context, 30)),
                child: CustomDropdown<String>(
                  decoration: CustomDropdownDecoration(
                    closedBorder: Border.all(color: themeNotifier.secondaryColor),
                    closedSuffixIcon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
                    expandedSuffixIcon: const Icon(Icons.keyboard_arrow_up_rounded, color: Colors.white),
                    closedFillColor: themeNotifier.primaryColor,
                    expandedFillColor: themeNotifier.secondaryColor,
                    hintStyle: const TextStyle(color: Colors.white),
                    listItemStyle: const TextStyle(color: Colors.white, fontSize: 16),
                    headerStyle: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  hintText: 'Select job role',
                  items: _list,
                  initialItem: _list[0],
                  onChanged: (value) {
                    debugPrint('changing value to: $value');
                  },
                ),
              ),
              SizedBox(height: _size.getHeight(context, 50)),
              ListTile(
                title: const Text("Ana Sayfa", style: TextStyle(color: Colors.white)),
                onTap: () async {
                  NavigatoinWdgt.navigatorKey.currentState?.navigateToPage(0, data: '');
                  await Future.delayed(const Duration(milliseconds: 100));
                  innerDrawerController.toggle?.call();
                },
              ),
              ListTile(
                title: const Text("QR Okut", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const QRScannerView()));
                },
              ),
              // ListTile(
              //   title: const Text("Hesapla", style: TextStyle(color: Colors.white)),
              //   onTap: () {},
              // ),
              ListTile(
                title: const Text("Poliçe", style: TextStyle(color: Colors.white)),
                onTap: () async {
                  NavigatoinWdgt.navigatorKey.currentState?.navigateToPage(1, data: '');
                  await Future.delayed(const Duration(milliseconds: 100));
                  innerDrawerController.toggle?.call();
                },
              ),
              ListTile(
                title: const Text("Ürünler", style: TextStyle(color: Colors.white)),
                onTap: () async {
                  NavigatoinWdgt.navigatorKey.currentState?.navigateToPage(2, data: '');
                  await Future.delayed(const Duration(milliseconds: 100));
                  innerDrawerController.toggle?.call();
                },
              ),
              ListTile(
                title: const Text("Profilim", style: TextStyle(color: Colors.white)),
                onTap: () async {
                  NavigatoinWdgt.navigatorKey.currentState?.navigateToPage(3, data: '');
                  await Future.delayed(const Duration(milliseconds: 100));
                  innerDrawerController.toggle?.call();
                },
              ),
              // ListTile(
              //   title: const Text("Bildirimler", style: TextStyle(color: Colors.white)),
              //   onTap: () {},
              // ),
              // ListTile(
              //   title: const Text("Ayarlar", style: TextStyle(color: Colors.white)),
              //   onTap: () {},
              // ),
              ListTile(
                title: const Text("Çıkış", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Root()), (route) => false);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}

class MyInnerDrawerController extends GetxController {
  void toggleDrawer() {
    debugPrint("Toggle drawer");
    innerDrawerController.toggle?.call();
    update();
  }
}
