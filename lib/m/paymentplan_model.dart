class PaymentPlan {
  final String date;
  final String amount;
  final String amountForex;
  final String currency;
  final String isHide;

  PaymentPlan({
    required this.date,
    required this.amount,
    required this.amountForex,
    required this.currency,
    required this.isHide,
  });

  factory PaymentPlan.fromJson(Map<String, dynamic> json) {
    return PaymentPlan(
      date: json['Date'],
      amount: json['Amount'],
      amountForex: json['Amount_Forex'],
      currency: json['Currency'],
      isHide: json['IsHide'],
    );
  }
}
