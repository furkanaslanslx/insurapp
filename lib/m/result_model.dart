class Result {
  final bool success;
  final dynamic data;
  final String message;

  Result({required this.success, this.data, required this.message});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      success: json['Success'] ?? true,
      data: json,
      message: json['Message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Success': success,
      'Data': data,
      'Message': message,
    };
  }
}
