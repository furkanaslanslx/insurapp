import 'package:flutter/foundation.dart';
import 'package:insurance/m/policy_model.dart';
import 'package:insurance/m/result_model.dart';
import 'package:insurance/services/api_service.dart';

class PolicyViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isFetching = false;
  bool isLoading = false;
  String errorMessage = '';
  List<Policy> policies = [];

  Future<void> fetchPolicies() async {
    if (_isFetching) return;
    _isFetching = true;
    isLoading = true;
    notifyListeners();

    Result result = await _apiService.getPolicyData();

    if (result.success) {
      final policyData = result.data as Map<String, dynamic>;
      if (policyData.isNotEmpty) {
        policies = policyData['Policy'].map<Policy>((e) => Policy.fromJson(e)).toList();
      } else {
        errorMessage = 'No policy data found.';
      }
    } else {
      errorMessage = result.message;
    }

    _isFetching = false;
    isLoading = false;
    notifyListeners();
  }
}
