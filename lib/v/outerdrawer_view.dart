import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:insurance/services/responsive.dart';
import 'package:insurance/services/variables.dart';
import 'package:insurance/v/outerdrawer_items/agency/agencyapplication_view.dart';
import 'package:insurance/v/login_view.dart';
import 'package:insurance/v/outerdrawer_items/damage_assistance/damage_assistance_view.dart';
import 'package:insurance/v/outerdrawer_items/institutional/institutional_view.dart';
import 'package:insurance/v/outerdrawer_items/products/products_view.dart';
import 'package:insurance/vm/themenotifier.dart';
import 'package:provider/provider.dart';

class OuterDrawerView extends GetView<MyOuterDrawerController> {
  const OuterDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyOuterDrawerController>(
      builder: (_) => Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
        return ZoomDrawer(
          controller: outerDrawerController,
          style: DrawerStyle.defaultStyle,
          menuScreen: OuterMenuScreen(),
          mainScreen: const LoginView(),
          borderRadius: 24.0,
          showShadow: false,
          angle: 0.0,
          // drawerShadowsBackgroundColor: Colors.grey[300]!,
          slideWidth: MediaQuery.of(context).size.width * 0.9,
          menuBackgroundColor: themeNotifier.secondaryColor,
          duration: const Duration(milliseconds: 350),
          mainScreenScale: 0.2,
        );
      }),
    );
  }
}

class OuterMenuScreen extends GetView<MyOuterDrawerController> {
  OuterMenuScreen({super.key});
  final ResponsiveSize _size = ResponsiveSize();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return Material(
        color: themeNotifier.secondaryColor,
        child: Container(
          color: themeNotifier.secondaryColor,
          height: _size.getHeight(context, 1334),
          width: _size.getWidth(context, 750),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SizedBox(
                  height: _size.getWidth(context, 300),
                  width: _size.getWidth(context, 300),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Image.asset("assets/images/Arex-Branding-2.png"),
                  ),
                ),
              ),
              SizedBox(height: _size.getHeight(context, 50)),
              ListTile(
                title: Text("ÜRÜNLER", style: TextStyle(color: themeNotifier.primaryColor)),
                onTap: () async {
                  // outerDrawerController.toggle?.call();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductsView()));
                  await Future.delayed(const Duration(milliseconds: 100));
                  outerDrawerController.toggle?.call();
                },
              ),
              Divider(color: themeNotifier.primaryColor, height: 0),
              ListTile(
                title: Text("KURUMSAL", style: TextStyle(color: themeNotifier.primaryColor)),
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const InstitutionalView()));
                  await Future.delayed(const Duration(milliseconds: 100));
                  outerDrawerController.toggle?.call();
                },
              ),
              Divider(color: themeNotifier.primaryColor, height: 0),
              ListTile(
                title: Text("ACENTE", style: TextStyle(color: themeNotifier.primaryColor)),
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AgencyapplicationView()));
                  await Future.delayed(const Duration(milliseconds: 100));
                  outerDrawerController.toggle?.call();
                },
              ),
              Divider(color: themeNotifier.primaryColor, height: 0),
              ListTile(
                title: Text("HASAR YARDIM", style: TextStyle(color: themeNotifier.primaryColor)),
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DamageAssistanceView()));
                  await Future.delayed(const Duration(milliseconds: 100));
                  outerDrawerController.toggle?.call();
                },
              ),
              Divider(color: themeNotifier.primaryColor, height: 0),
              ListTile(
                title: Text("KEŞFET", style: TextStyle(color: themeNotifier.primaryColor)),
                onTap: () {},
              ),
              Divider(color: themeNotifier.primaryColor, height: 0),
              ListTile(
                title: Text("RAPORLAR VE YATIRIMCI İLİŞKİLERİ", style: TextStyle(color: themeNotifier.primaryColor)),
                onTap: () {},
              ),
              Divider(color: themeNotifier.primaryColor, height: 0),
              ListTile(
                title: Text("ONLİNE İŞLEMLER", style: TextStyle(color: themeNotifier.primaryColor)),
                onTap: () {},
              ),

              // Diğer menü öğeleri...
            ],
          ),
        ),
      );
    });
  }
}

class MyOuterDrawerController extends GetxController {
  void toggleDrawer() {
    debugPrint("Toggle drawer");
    outerDrawerController.toggle?.call();
    update();
  }
}