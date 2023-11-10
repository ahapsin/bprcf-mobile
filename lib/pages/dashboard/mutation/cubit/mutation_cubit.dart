import 'package:bloc/bloc.dart';
import 'package:bprcf/data/model/mutation.dart';
import 'package:bprcf/services/dio.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'mutation_state.dart';

class MutationCubit extends Cubit<MutationState> {
  MutationCubit() : super(MutationInitial());
  Future getData({required Map? dataBody}) async {
    emit(MutationLoading());
    Dio.Response response = await dio().post('history_account', data: dataBody);
    final List<dynamic> responseData = response.data['data'];
    List<MutationModel> mutation =
        responseData.map((json) => MutationModel.fromJson(json)).toList();
    emit(MutationLoaded(mutations: mutation));
  }
}
