import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({
    required String url,
    String? token,
  }) async {
    final Map<String, String> headers = {};
    if (token != null) {
      headers["Authorization"] = "Bearer $token";
    }
    print('url = $url token = $token');

    try {
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Problem with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in GET request: $e');
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> post({
    required String url,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json', // Use JSON if the server expects it
    };
    if (token != null) {
      headers["Authorization"] = "Bearer $token";
    }
    print('url = $url body = $body token = $token');

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body), // Encode body as JSON
        headers: headers,
      );
      print('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Problem with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in POST request: $e');
      throw Exception('Failed to create data');
    }
  }

  Future<dynamic> put({
    required String url,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json', // Use JSON if the server expects it
    };
    if (token != null) {
      headers["Authorization"] = "Bearer $token";
    }
    print('url = $url body = $body token = $token');

    try {
      http.Response response = await http.put(
        Uri.parse(url),
        body: jsonEncode(body), // Encode body as JSON
        headers: headers,
      );
      print('Response body: ${response.body}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Problem with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in PUT request: $e');
      throw Exception('Failed to update data');
    }
  }
}
