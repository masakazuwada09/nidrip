import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://nidrip.mraalionline.com/api";

  /// SIGNUP (Node: /by-email)
  static Future<Map<String, dynamic>> signup({
    required String email,
    required String password,
    String userReferredBy = "",
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/by-email"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "user_referred_by": userReferredBy,
        }),
      );

      return _parseResponse(response);
    } catch (e) {
      return {"status": false, "message": "Error: $e"};
    }
  }

  /// LOGIN (Node: /login)
  static Future<Map<String, dynamic>> login({
    required String identifier,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"identifier": identifier, "user_password": password}),
      );

      return _parseResponse(response);
    } catch (e) {
      return {"status": false, "message": "Error: $e"};
    }
  }

  /// VERIFY OTP (Node: /by-email-otp)
  static Future<Map<String, dynamic>> verifyOtp({
    required String userCc,
    required String userOtp,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/by-email-otp"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"user_cc": userCc, "user_otp": userOtp}),
      );

      return _parseResponse(response);
    } catch (e) {
      return {"status": false, "message": "Error: $e"};
    }
  }

  /// FORGOT PASSWORD (Node: /forgot-password)
  static Future<Map<String, dynamic>> forgotPassword({
    required String email,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/forgot-password"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email}),
      );

      if (response.statusCode == 200 || response.statusCode == 404) {
        return json.decode(response.body);
      } else {
        return {
          "success": false,
          "message": "Server error: ${response.statusCode}",
        };
      }
    } catch (e) {
      return {"success": false, "message": "Error: $e"};
    }
  }

  /// Helper to parse response
  static Map<String, dynamic> _parseResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return {
        "status": false,
        "message": "Server error: ${response.statusCode}",
      };
    }
  }
}
