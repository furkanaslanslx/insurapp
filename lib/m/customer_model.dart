class Customer {
  final int type;
  final String customerCode;
  final String customerType;
  final String idNo;
  final String customerName;
  final String address;
  final String email;
  final String isHide;

  Customer({
    required this.type,
    required this.customerCode,
    required this.customerType,
    required this.idNo,
    required this.customerName,
    required this.address,
    required this.email,
    required this.isHide,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      type: json['Type'],
      customerCode: json['CustomerCode'],
      customerType: json['CustomerType'],
      idNo: json['IdNo'],
      customerName: json['CustomerName'],
      address: json['Adress'],
      email: json['Email'],
      isHide: json['IsHide'],
    );
  }
}
