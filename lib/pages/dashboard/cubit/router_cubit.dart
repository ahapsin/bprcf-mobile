import 'package:bloc/bloc.dart';
import 'package:bprcf/services/dio.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(RouterInitial());
  Future getData({required String user}) async {
    emit(RouterLoading());
    Dio.Response response =
        await dio().get('https://reqres.in/api/users/$user');
    emit(RouterLoaded(user: response.data));
  }
}
