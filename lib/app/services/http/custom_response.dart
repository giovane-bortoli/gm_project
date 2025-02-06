final class CustomResponse {
  final int statusCode;
  final Map<String, dynamic> body;
  final Map<String, String> headers;

  CustomResponse({
    required this.statusCode,
    required this.body,
    required this.headers,
  });
}
