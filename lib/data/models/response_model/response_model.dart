class ResponseModel {
  final String message;
  final String? error;

  ResponseModel({
    required this.message,
    this.error,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      message: json['message'],
      error: json['error'],
    );
  }
}
