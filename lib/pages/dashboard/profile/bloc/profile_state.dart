part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoding extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final List<Profile> profile;
  ProfileLoaded(this.profile);
}

final class ProfileError extends ProfileState {}
