part of 'adviser_bloc.dart';

@immutable
abstract class AdvicerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdvicerInitial extends AdvicerState {}

class AdviceLoading extends AdvicerState {}

class AdviceLoaded extends AdvicerState {
  final String advice;
  AdviceLoaded({required this.advice});

  @override
  List<Object?> get props => [advice];
}

class AdviceError extends AdvicerState {
  final String error;
  AdviceError({required this.error});

  @override
  List<Object?> get props => [error];
}
