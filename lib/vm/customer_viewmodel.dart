import 'package:flutter/material.dart';
import 'package:insurance/m/customer_model.dart';
import 'package:insurance/services/api_service.dart';

class CustomerViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  Customer? customer;
  bool isLoading = false;
  String errorMessage = '';

  CustomerViewModel();

  Future<void> fetchCustomer() async {
    isLoading = true;
    notifyListeners();

    final result = await _apiService.getCustomerData();

    if (result.success) {
      customer = result.data;
      errorMessage = '';
    } else {
      errorMessage = result.message;
    }

    isLoading = false;
    notifyListeners();
  }
}
