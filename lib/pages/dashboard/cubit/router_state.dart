part of 'router_cubit.dart';

@immutable
abstract class RouterState {}

final class RouterInitial extends RouterState {}

final class RouterLoading extends RouterState {}

final class RouterError extends RouterState {}

final class RouterLoaded extends RouterState {
  final Map<String, dynamic> user;
  RouterLoaded({required this.user});
}
