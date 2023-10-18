import 'package:bprcf/services/dio.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get authenticated => _isLoggedIn;

  Future<void> login({required Map creds}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(creds);
    Dio.Response response = await dio().post('/auth/login', data: creds);
    final String token = response.data.toString();
    print('token $token');
    await prefs.setString('token', token);
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;

    notifyListeners();
  }
}
