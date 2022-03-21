import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sravel/models/user.dart';

class ApiResponse {
  // _data will hold any response converted into
  // its own object. For example user.
  Object? _data;
  // _apiError will hold the error object
  Object? _apiError;

  Object? get Data => _data;
  set Data(Object? data) => _data = data;

  Object? get ApiError => _apiError;
  set ApiError(Object? error) => _apiError = error;
}

class ApiError {
  late String _error;

  ApiError({required String error}) {
    _error = error;
  }

  String get error => _error;
  set error(String error) => _error = error;

  ApiError.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = _error;
    return data;
  }
}

String _baseUrl = "http://localhost:8000/";
Future<ApiResponse> authenticateUser(String email, String password) async {
  ApiResponse _apiResponse = ApiResponse();

  try {
    final response = await http.post(
      Uri.parse('${_baseUrl}user/login/check'),
      body: {
        'email': email,
        'password': password,
      },
    );

    switch (response.statusCode) {
      case 200:
        _apiResponse.Data = User.fromJson(json.decode(response.body));
        break;
      case 401:
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    _apiResponse.ApiError = ApiError(error: "Server error. Please retry");
  }
  return _apiResponse;
}

Future<ApiResponse> getUserDetails(String email) async {
  ApiResponse _apiResponse = ApiResponse();
  try {
    final response = await http.get(Uri.parse('${_baseUrl}user/$email'));

    switch (response.statusCode) {
      case 200:
        _apiResponse.Data = User.fromJson(json.decode(response.body));
        break;
      case 401:
        print((_apiResponse.ApiError as ApiError).error);
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        print((_apiResponse.ApiError as ApiError).error);
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    _apiResponse.ApiError = ApiError(error: "Server error. Please retry");
  }
  return _apiResponse;
}
