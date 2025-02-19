import 'package:flutter/material.dart';
import 'package:insurance/services/variables.dart';

class InnerDrawerProvider extends ChangeNotifier {
  void toggleDrawer() {
    debugPrint("Toggle inner drawer");
    innerDrawerController.toggle?.call();
    notifyListeners();
  }
}

class OuterDrawerProvider extends ChangeNotifier {
  void toggleDrawer() {
    debugPrint("Toggle outer drawer");
    outerDrawerController.toggle?.call();
    notifyListeners();
  }
}
