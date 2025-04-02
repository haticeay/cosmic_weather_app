// ignore_for_file: body_might_complete_normally_nullable, use_build_context_synchronously, unused_field, unrelated_type_equality_checks
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:cosmic_weather_app/core/components/custom_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NasaService<T> extends ChangeNotifier {
  static const String baseUrl = "https://api.nasa.gov/insight_weather/";
  static const String apiKey = "DEMO_KEY"; // Burada kendi API key'ini kullanmalısın.

  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<T?> getMethod({
    required String url,
    Map<String, dynamic>? queryParameters,
    bool token = false,
    Function(Map<String, dynamic>)? fromJson,
    BuildContext? context,
  }) async {
    Response? response;
    try {
      queryParameters ??= {};
      queryParameters["api_key"] = apiKey; // API anahtarını ekliyoruz
      queryParameters["feedtype"] = "json";
      queryParameters["ver"] = "1.0";

      response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );

      log("${response.data}", name: "$baseUrl$url");
      if (response.statusCode == HttpStatus.ok) {
        if (fromJson != null) {
          return fromJson(response.data as Map<String, dynamic>);
        }
        return response.data as T?;
      } else {
        log("${response.statusCode}: ${response.data}", name: "GET ERROR");
        return null;
      }
    } on DioException catch (error) {
      log(error.toString(), name: "GET ERROR");
      if (error.response != null) {
        log("Response data: ${error.response?.data}", name: "GET ERROR");
        if (context != null) {
          showError(context, extractMessage(error.response?.data));
        }
      }
      return null;
    } catch (error) {
      log(error.toString(), name: "GET ERROR");
      return null;
    }
  }

  void showError(BuildContext context, String message) {
    CustomSnackBar(context: context, message: "$message !").showSnackBar();
  }

  String extractMessage(dynamic errorData) {
    if (errorData is Map<String, dynamic> && errorData.containsKey('err')) {
      return errorData['err'];
    }
    return 'Bilinmeyen bir hata oluştu.';
  }
}
