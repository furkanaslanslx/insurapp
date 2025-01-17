class PolicyStatus {
  final String policyNo;
  final String statusMessage;
  final String status;
  final String explanation;
  final String startDate;
  final String endDate;

  PolicyStatus({
    required this.policyNo,
    required this.statusMessage,
    required this.status,
    required this.explanation,
    required this.startDate,
    required this.endDate,
  });

  factory PolicyStatus.fromJson(Map<String, dynamic> json) {
    return PolicyStatus(
      policyNo: json['PolicyNo'],
      statusMessage: json['StatusMessage'],
      status: json['Status'],
      explanation: json['Explanation'],
      startDate: json['StartDate'],
      endDate: json['EndDate'],
    );
  }
}
