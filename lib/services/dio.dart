import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = new Dio();

  dio.options.baseUrl = 'http://8a73085df21a.sn.mynetname.net:8080/api';
  dio.options.headers['accept'] = 'Application/Json';

  return dio;
}
