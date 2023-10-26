import 'dart:convert';

import 'package:bprcf/data/model/profile.dart';
import 'package:bprcf/data/model/user.dart';
import 'package:bprcf/services/dio.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:shared_preferences/shared_preferences.dart';

class RemoteDataSource {
  

  Future<DataUser> getUsers() async {
    final Dio.Response response = await dio().get('/employee');
    print(response.data);
    return DataUser.fromJson(response.data);
  }

  Future<Map<String, dynamic>?> getProfile() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final Dio.Response response = await dio().get('auth/me',
        options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));
    //final profile = profileFromJson(response.toString());
     return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>?> getMutation() async {
    final Dio.Response response = await dio().get('history_account/0013000344');
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>?> getTerms() async {
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final Dio.Response response = await dio().get('terms',
        options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));
        print('terms token $token');
    return response.data as Map<String, dynamic>;
  }
}
