import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = new Dio();

  dio.options.baseUrl = 'http://192.168.6.17:8000/api/';
  dio.options.headers['accept'] = 'Application/Json';
  dio.options.followRedirects = false;

  return dio;
}
