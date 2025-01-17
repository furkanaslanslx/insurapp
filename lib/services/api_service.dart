import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:insurance/m/customer_model.dart';
import 'package:insurance/m/insurance_agent.dart';
import 'package:insurance/m/paymentplan_model.dart';
import 'package:insurance/m/policyguarantee_model.dart';
import 'package:insurance/m/policystatus_model.dart';
import 'package:insurance/m/product_model.dart';
import 'package:insurance/m/result_model.dart';

class ApiService {
  final bool useLocalData = true;

  Future<Result> getPolicyData() async {
    const String localDatabaseFile = 'assets/policy_db.json';
    // await Future.delayed(const Duration(seconds: 1));

    try {
      final jsonData = await rootBundle.loadString(localDatabaseFile);
      Map<String, dynamic> data = json.decode(jsonData);
      Result obj = Result(
        success: true,
        message: 'Policy data successfully loaded.',
        data: data,
      );
      return obj;
    } on Exception catch (e) {
      return Result(
        success: false,
        message: 'Error loading Policy data: $e',
        data: null,
      );
    }
  }

  Future<Result> getPolicyStatusData() async {
    const String localDatabaseFile = 'assets/policystatus_db.json';
    await Future.delayed(const Duration(seconds: 1));
    try {
      final jsonData = await rootBundle.loadString(localDatabaseFile);
      final data = json.decode(jsonData);
      return Result(
        success: true,
        message: 'Policy Status successfully loaded.',
        data: PolicyStatus.fromJson(data),
      );
    } on Exception catch (e) {
      return Result(
        success: false,
        message: 'Error loading Policy Status data: $e',
        data: null,
      );
    }
  }

  Future<Result> getPolicyGuaranteeData() async {
    const String localDatabaseFile = 'assets/policyguarantee_db.json';
    await Future.delayed(const Duration(seconds: 1));
    try {
      final jsonData = await rootBundle.loadString(localDatabaseFile);
      final data = json.decode(jsonData);
      return Result(
        success: true,
        message: 'Policy Guarantee successfully loaded.',
        data: PolicyGuarantee.fromJson(data),
      );
    } on Exception catch (e) {
      return Result(
        success: false,
        message: 'Error loading Policy Guarantee data: $e',
        data: null,
      );
    }
  }

  Future<Result> getPaymentPlanData() async {
    const String localDatabaseFile = 'assets/paymentplan_db.json';
    await Future.delayed(const Duration(seconds: 1));
    try {
      final jsonData = await rootBundle.loadString(localDatabaseFile);
      final data = json.decode(jsonData);
      return Result(
        success: true,
        message: 'Payment Plan successfully loaded.',
        data: PaymentPlan.fromJson(data),
      );
    } on Exception catch (e) {
      return Result(
        success: false,
        message: 'Error loading Payment Plan data: $e',
        data: null,
      );
    }
  }

  Future<Result> getProductData() async {
    const String localDatabaseFile = 'assets/productmodel_db.json';
    await Future.delayed(const Duration(seconds: 1));
    try {
      final jsonData = await rootBundle.loadString(localDatabaseFile);
      final data = json.decode(jsonData);
      return Result(
        success: true,
        message: 'Product successfully loaded.',
        data: Product.fromJson(data),
      );
    } on Exception catch (e) {
      return Result(
        success: false,
        message: 'Error loading Product data: $e',
        data: null,
      );
    }
  }

  Future<Result> getCustomerData() async {
    const String localDatabaseFile = 'assets/customer_db.json';
    await Future.delayed(const Duration(seconds: 1));
    try {
      final jsonData = await rootBundle.loadString(localDatabaseFile);
      final data = json.decode(jsonData);
      return Result(
        success: true,
        message: 'Customer data successfully loaded.',
        data: Customer.fromJson(data),
      );
    } on Exception catch (e) {
      return Result(
        success: false,
        message: 'Error loading Customer data: $e',
        data: null,
      );
    }
  }

  Future<Result> getInsuranceData() async {
    const String localDatabaseFile = 'assets/insurance_db.json';
    await Future.delayed(const Duration(seconds: 1));
    try {
      final jsonData = await rootBundle.loadString(localDatabaseFile);
      final data = json.decode(jsonData);
      return Result(
        success: true,
        message: 'Insurance data successfully loaded.',
        data: InsuranceAgent.fromJsonList(data),
      );
    } on Exception catch (e) {
      return Result(
        success: false,
        message: 'Error loading Insurance data: $e',
        data: null,
      );
    }
  }
}
