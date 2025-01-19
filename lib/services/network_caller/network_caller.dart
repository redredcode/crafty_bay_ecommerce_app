import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final dynamic responseData;
  final String errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.responseData,
    this.errorMessage = 'Something went wrong',
  });
}

class NetworkCaller {
  // using the logger package
  final Logger _logger = Logger();

  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      //_logger.i('URL => $url');
      _logRequest(url);
    Response response = await get(uri);
    _logResponse(url, response.statusCode, response.headers, response.body);
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedData,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      _logResponse(url, -1, null, '');
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(String url, {Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'content-type' : 'application/json'
      };
      //_logger.i('URL => $url');
      _logRequest(url);
    Response response = await post(uri, headers: headers, body: jsonEncode(body));
    _logResponse(url, response.statusCode, response.headers, response.body);
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedData,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      _logResponse(url, -1, null, '');
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(String url,
      [Map<String, dynamic>? headers, Map<String, dynamic>? body]) {
    // the params in [] means these are optional params
    _logger.i('URL => $url\nHEADERS => $headers\nBODY => $body');
  }

  void _logResponse(String url, int statusCode, Map<String, String>? headers,
      String body, [String? errorMessage]) {
    if (errorMessage != null) {
      _logger.e(
          'URL => $url\nERROR MESSAGE => $errorMessage');
    } else {
      _logger.i(
          'URL => $url\nHEADERS => $headers\nSTATUS CODE => $statusCode\nBODY => $body');
    }
  }
}
