import 'package:dio/dio.dart';

class DioHelper {
  static final Dio _dio = Dio();
  static const String _baseApi =
      'https://d67c-196-205-94-85.eu.ngrok.io/api/v1';
  static Future<Response> get(String url,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? parameters}) async {
    return await _dio.get('$_baseApi/$url',
        queryParameters: body, options: Options(headers: headers));
  }

  static Future<Response> post(String url,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? parameters}) async {
    try {
      return await _dio.post('$_baseApi/$url',
        queryParameters: parameters,  data: body, options: Options(headers: headers));
    } on DioError catch (e) {
      return e.response!;
    }
  }
}
