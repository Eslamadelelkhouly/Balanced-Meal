import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});
  Future<Map<String, dynamic>> Post(
      {required String endpoint, required dynamic data}) async {
    var response = await dio.post(
      '$endpoint',
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    return response.data;
  }

  
}
