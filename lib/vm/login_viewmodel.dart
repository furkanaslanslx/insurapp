import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  bool _isLoggedIn = false;
  String _token = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  bool get isLoggedIn => _isLoggedIn;
  String get token => _token;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      // TODO: API call to login
      await Future.delayed(const Duration(seconds: 2)); // Simulated API call

      // Simulated successful login
      if (username == 'test' && password == 'test123') {
        _token = 'dummy_token';
        _isLoggedIn = true;
        await _saveLoginState();
      } else {
        _errorMessage = 'Geçersiz kullanıcı adı veya şifre';
      }
    } catch (e) {
      _errorMessage = 'Giriş yapılırken bir hata oluştu: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      // TODO: API call to logout if needed
      await Future.delayed(const Duration(seconds: 1)); // Simulated API call

      _token = '';
      _isLoggedIn = false;
      await _clearLoginState();
    } catch (e) {
      _errorMessage = 'Çıkış yapılırken bir hata oluştu: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> checkLoginState() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      _token = prefs.getString('token') ?? '';
    } catch (e) {
      _errorMessage = 'Oturum durumu kontrol edilirken bir hata oluştu: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _saveLoginState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', _isLoggedIn);
      await prefs.setString('token', _token);
    } catch (e) {
      _errorMessage = 'Oturum bilgileri kaydedilirken bir hata oluştu: $e';
    }
  }

  Future<void> _clearLoginState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('isLoggedIn');
      await prefs.remove('token');
    } catch (e) {
      _errorMessage = 'Oturum bilgileri silinirken bir hata oluştu: $e';
    }
  }

  void resetError() {
    _errorMessage = '';
    notifyListeners();
  }
}
