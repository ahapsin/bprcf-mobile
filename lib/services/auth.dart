import 'dart:io';

import 'package:bprcf/services/dio.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isVerified = false;

  bool get authenticated => _isLoggedIn;
  bool get verified => _isVerified;

  Future<void> login({required Map creds}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   Dio.Response response = await dio().post('/auth/login', data: creds);

    final String token = response.data['token'].toString();
    final String verify = response.data['verify'].toString();
    final String identifier = response.data['identifier'].toString();

    await prefs.setString('token', token);
    await prefs.setString('verify', verify);
    await prefs.setString('identifier', identifier);

    Map credsToVerify = {
      'token': token,
      'phone': verify,
      // 'exp': 'expirenya kapan',
      'status': 'statusnya apa'
    };
    Dio.Response verifyRequest = await dio().post('/verifying',data: credsToVerify);

    print(response.data);
    print(verifyRequest.data);

    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> getDeviceDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        final String deviceId = "${build.device}_${build.id}";
        await prefs.setString('deviceId', deviceId);
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
      }
    } on PlatformException {
      print('failed to get platform info');
    }
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
