class InsuranceAgent {
  final String name;
  final String phone;
  final String email;
  final String address;
  final String? mapLink;

  InsuranceAgent({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    this.mapLink,
  });

  factory InsuranceAgent.fromJson(Map<String, dynamic> json) {
    return InsuranceAgent(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      mapLink: json['map_link'] as String?,
    );
  }

  static List<InsuranceAgent> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => InsuranceAgent.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'map_link': mapLink,
    };
  }
}
