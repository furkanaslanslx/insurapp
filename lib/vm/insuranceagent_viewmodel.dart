import 'package:flutter/material.dart';

import 'package:insurance/m/insurance_agent.dart';
import 'package:insurance/services/api_service.dart';

class InsuranceagentViewmodel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<InsuranceAgent> insuranceAgents = [];
  bool isLoading = false;
  bool _isFetching = false;
  String errorMessage = '';

  InsuranceagentViewmodel();

  Future<void> fetchInsuranceAgents() async {
    if (_isFetching) return;

    _isFetching = true;
    isLoading = true;
    notifyListeners();

    final result = await _apiService.getInsuranceData();

    if (result.success) {
      insuranceAgents = result.data;
      errorMessage = '';
    } else {
      errorMessage = result.message;
    }

    isLoading = false;
    _isFetching = false;
    notifyListeners();
  }
}
