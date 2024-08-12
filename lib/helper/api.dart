import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({
    required String url,
    @required String? token,
  }) async {
    final Map<String, String> headers = {};
    if (token != Null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
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
    @required Map<String, dynamic>? body,
    @required String? token,
  }) async {
    final Map<String, String> headers = {};
    if (token != Null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: body,
        headers: headers,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'Problem with status code: ${response.statusCode} , with body ${jsonDecode(response.body)}');
      }
    } catch (e) {
      print('Error in POST request: $e');
      throw Exception('Failed to create data');
    }
  }

  Future<dynamic> put({
    required String url,
    @required Map<String, dynamic>? body,
    @required String? token,
  }) async {
    final Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    if (token != Null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: body,
        headers: headers,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'Problem with status code: ${response.statusCode} , with body ${jsonDecode(response.body)}');
      }
    } catch (e) {
      print('Error in POST request: $e');
      throw Exception('Failed to create data');
    }
  }
}
