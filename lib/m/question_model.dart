class Question {
  final String code;
  final String explanation;
  final String valueCode;
  final String value;

  Question({
    required this.code,
    required this.explanation,
    required this.valueCode,
    required this.value,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      code: json['Code'],
      explanation: json['Explanation'],
      valueCode: json['ValueCode'],
      value: json['Value'],
    );
  }
}
