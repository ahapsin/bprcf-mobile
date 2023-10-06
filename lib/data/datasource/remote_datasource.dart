import 'package:bprcf/data/model/user.dart';
import 'package:dio/dio.dart';

class RemoteDataSource {
  final dio = Dio(BaseOptions(baseUrl: 'http://8a73085df21a.sn.mynetname.net:8080/api'));

  Future<DataUser> getUsers() async {
    final response = await dio.get('/employees');
    return DataUser.fromJson(response.data);
  }
}
