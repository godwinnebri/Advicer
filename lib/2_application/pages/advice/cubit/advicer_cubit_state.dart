part of 'advicer_cubit_cubit.dart';

abstract class AdvicerCubitState extends Equatable {
  const AdvicerCubitState();

  @override
  List<Object?> get props => [];
}

class AdviceStateInitial extends AdvicerCubitState {}

class AdviceStateLoading extends AdvicerCubitState {}

class AdviceStateLoaded extends AdvicerCubitState {
  final String advice;
  const AdviceStateLoaded({required this.advice});

  @override
  List<Object?> get props => [advice];
}

class AdviceStateError extends AdvicerCubitState {
  final String error;
  const AdviceStateError({required this.error});

  @override
  List<Object?> get props => [error];
}
