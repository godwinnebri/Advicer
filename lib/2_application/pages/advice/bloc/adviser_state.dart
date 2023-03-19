part of 'adviser_bloc.dart';

@immutable
abstract class AdviserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdviserInitial extends AdviserState {}

class AdviseLoading extends AdviserState {}

class AdviseLoaded extends AdviserState {
  final String advice;
  AdviseLoaded({required this.advice});

  @override
  List<Object?> get props => [advice];
}

class AdviseError extends AdviserState {
  final String error;
  AdviseError({required this.error});

  @override
  List<Object?> get props => [error];
}
