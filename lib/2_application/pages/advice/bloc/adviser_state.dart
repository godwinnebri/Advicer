part of 'adviser_bloc.dart';

@immutable
abstract class AdviserState {}

class AdviserInitial extends AdviserState {}

class AdviseLoading extends AdviserState {}

class AdviseLoaded extends AdviserState {
  final String advice;
  AdviseLoaded({required this.advice});
}

class AdviseError extends AdviserState {
  final String error;
  AdviseError({required this.error});
}
