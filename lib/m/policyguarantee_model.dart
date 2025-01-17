class PolicyGuarantee {
  final String code;
  final String name;
  final String amount;
  final String amountForex;
  final String currency;
  final String isHide;

  PolicyGuarantee({
    required this.code,
    required this.name,
    required this.amount,
    required this.amountForex,
    required this.currency,
    required this.isHide,
  });

  factory PolicyGuarantee.fromJson(Map<String, dynamic> json) {
    return PolicyGuarantee(
      code: json['Code'],
      name: json['Name'],
      amount: json['Amount'],
      amountForex: json['Amount_Forex'],
      currency: json['Currency'],
      isHide: json['IsHide'],
    );
  }
}
