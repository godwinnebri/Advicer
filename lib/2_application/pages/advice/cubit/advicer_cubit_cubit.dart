import 'package:adviser_app/1_domain/entities/advice_entites.dart';
import 'package:adviser_app/1_domain/failures/failures.dart';
import 'package:adviser_app/1_domain/usecases/advice_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'advicer_cubit_state.dart';

const String serverErrorMessage = 'Oops, there is an error with the API';
const String cacheErrorMessage = 'Oops, cache failed. Try again';
const String generalErrorMessage = 'Oops, something is wrong, try again';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  final AdviceUseCases adviceUseCases;

  AdvicerCubit({required this.adviceUseCases}) : super(AdviceStateInitial());

  void adviceRequested() async {
    emit(AdviceStateLoading());
    final failureOrAdvice = await adviceUseCases.getAdvise();

    failureOrAdvice.fold(
      (failure) => emit(AdviceStateError(error: _mapFailureToMessage(failure))),
      (advise) => emit(AdviceStateLoaded(advice: advise.advise)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerError:
        return serverErrorMessage;

      case CacheError:
        return cacheErrorMessage;

      default:
        return generalErrorMessage;
    }
  }
}
