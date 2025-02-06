import 'package:gm_project/app/services/http/custom_response.dart';

abstract interface class CustomClient {
  Future<CustomResponse> get(Uri url, {Map<String, String>? headers});
}
