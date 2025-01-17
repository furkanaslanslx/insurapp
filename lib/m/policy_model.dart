import 'package:insurance/m/customer_model.dart';
import 'package:insurance/m/paymentplan_model.dart';
import 'package:insurance/m/policyguarantee_model.dart';

class Policy {
  final String policyNo;
  final String agencyNo;
  final String agencyName;
  final String productCode;
  final String productName;
  final String status;
  final int rowNumber;
  final int renewalNo;
  final int documentNo;
  final String startDate;
  final String endDate;
  final String orderDate;
  final String policyPdfUrl;
  final List<Customer> customers;
  final List<PolicyGuarantee> policyGuarantees;
  final List<PaymentPlan> paymentPlan;

  Policy({
    required this.policyNo,
    required this.agencyNo,
    required this.agencyName,
    required this.productCode,
    required this.productName,
    required this.status,
    required this.rowNumber,
    required this.renewalNo,
    required this.documentNo,
    required this.startDate,
    required this.endDate,
    required this.orderDate,
    required this.policyPdfUrl,
    required this.customers,
    required this.policyGuarantees,
    required this.paymentPlan,
  });

  factory Policy.fromJson(Map<String, dynamic> json) {
    return Policy(
      policyNo: json['PolicyNo'],
      agencyNo: json['AgencyNo'],
      agencyName: json['AgencyName'],
      productCode: json['ProductCode'],
      productName: json['ProductName'],
      status: json['Status'],
      rowNumber: json['RowNumber'],
      renewalNo: json['RenewalNo'],
      documentNo: json['DocumentNo'],
      startDate: json['StartDate'],
      endDate: json['EndDate'],
      orderDate: json['OrderDate'],
      policyPdfUrl: json['PolicyPdfUrl'],
      customers: (json['Customers'] as List).map((e) => Customer.fromJson(e)).toList(),
      policyGuarantees: (json['PolicyGuarantees'] as List).map((e) => PolicyGuarantee.fromJson(e)).toList(),
      paymentPlan: (json['PaymentPlan'] as List).map((e) => PaymentPlan.fromJson(e)).toList(),
    );
  }
}
