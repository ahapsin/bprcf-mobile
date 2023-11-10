part of 'mutation_cubit.dart';

@immutable
abstract class MutationState {}

final class MutationInitial extends MutationState {}

final class MutationLoading extends MutationState {}

final class MutationLoaded extends MutationState {
  final List<MutationModel> mutations;
  MutationLoaded({required this.mutations});
}
