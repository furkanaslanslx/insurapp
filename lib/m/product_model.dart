import 'package:insurance/m/productguarantee_model.dart';
import 'package:insurance/m/question_model.dart';

class Product {
  final String code;
  final String name;
  final List<Question> questions;
  final List<ProductGuarantee> productGuarantees;

  Product({
    required this.code,
    required this.name,
    required this.questions,
    required this.productGuarantees,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      code: json['Code'],
      name: json['Name'],
      questions: (json['Questions'] as List).map((e) => Question.fromJson(e)).toList(),
      productGuarantees: (json['ProductGuarantees'] as List).map((e) => ProductGuarantee.fromJson(e)).toList(),
    );
  }
}
