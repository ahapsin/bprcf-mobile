import 'package:bprcf/services/dio.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = true;

  bool get authenticated => _isLoggedIn;

  Future<void> login({required Map creds}) async {
    print(creds);
    // Dio.Response response = await dio().post('/auth/login', data: creds);
    // print(response.data.toString());
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;

    notifyListeners();
  }
}
