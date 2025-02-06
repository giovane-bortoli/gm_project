import 'dart:convert';

import 'package:gm_project/app/services/http/custom_client.dart';
import 'package:gm_project/app/services/http/custom_response.dart';
import 'package:http/http.dart' as http;

class CustomClientImpl implements CustomClient {
  @override
  Future<CustomResponse> get(Uri url, {Map<String, String>? headers}) async {
    final response = await http.get(url, headers: headers);
    return CustomResponse(
      statusCode: response.statusCode,
      body: jsonDecode(response.body) as Map<String, dynamic>,
      headers: response.headers,
    );
  }
}
