import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  Color _primaryColor = const Color(0xFF1a1532);
  Color _secondaryColor = const Color(0xFF57bec5);

  static const String primaryColorKey = "A1b2C3d4E5";
  static const String secondaryColorKey = "F6g7H8i9J0";

  ThemeNotifier() {
    _loadColors();
  }

  Color get primaryColor => _primaryColor;
  Color get secondaryColor => _secondaryColor;

  Future<void> _loadColors() async {
    final prefs = await SharedPreferences.getInstance();

    final primaryColorString = prefs.getString(primaryColorKey);
    if (primaryColorString != null && primaryColorString.length == 8) {
      try {
        int colorInt = int.parse(primaryColorString, radix: 16);
        _primaryColor = Color(colorInt);
      } catch (e) {
        // Hata durumunda varsayılan rengi kullan
      }
    }

    final secondaryColorString = prefs.getString(secondaryColorKey);
    if (secondaryColorString != null && secondaryColorString.length == 8) {
      try {
        int colorInt = int.parse(secondaryColorString, radix: 16);
        _secondaryColor = Color(colorInt);
      } catch (e) {
        // Hata durumunda varsayılan rengi kullan
      }
    }

    notifyListeners();
  }

  Future<void> setPrimaryColor(Color color) async {
    _primaryColor = color;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    String colorString = color.value.toRadixString(16).padLeft(8, '0');
    await prefs.setString(primaryColorKey, colorString);
  }

  Future<void> setSecondaryColor(Color color) async {
    _secondaryColor = color;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    String colorString = color.value.toRadixString(16).padLeft(8, '0');
    await prefs.setString(secondaryColorKey, colorString);
  }
}
