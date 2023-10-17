import 'package:bloc/bloc.dart';
import 'package:bprcf/data/datasource/remote_datasource.dart';
import 'package:bprcf/data/model/profile.dart';
import 'package:bprcf/data/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final RemoteDataSource remoteDataSource;
  ProfileBloc({required this.remoteDataSource}) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      emit(ProfileLoding());
      try {
        final result = await remoteDataSource.getProfile();
        print(result);
       //emit(ProfileLoaded());
      } catch (e) {
       print(e);
      }
    });
  }
}
