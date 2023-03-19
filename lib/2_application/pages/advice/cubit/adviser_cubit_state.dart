part of 'adviser_cubit_cubit.dart';

abstract class AdviserCubitState extends Equatable {
  const AdviserCubitState();

  @override
  List<Object?> get props => [];
}

class AdviseStateInitial extends AdviserCubitState {}

class AdviseStateLoading extends AdviserCubitState {}

class AdviseStateLoaded extends AdviserCubitState {
  final String advice;
  const AdviseStateLoaded({required this.advice});

  @override
  List<Object?> get props => [advice];
}

class AdviseStateError extends AdviserCubitState {
  final String error;
  const AdviseStateError({required this.error});

  @override
  List<Object?> get props => [error];
}
