import 'package:dio/dio.dart';

class Api {
  static final Dio _dio = Dio();
  static void configureDio() {
    _dio.options.baseUrl = 'https://rickandmortyapi.com/api/';
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);
      return resp.data;
    } on DioException {
      rethrow;
    }
  }
}
