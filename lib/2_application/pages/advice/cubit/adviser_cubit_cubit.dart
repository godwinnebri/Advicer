import 'package:adviser_app/1_domain/entities/advise_entites.dart';
import 'package:adviser_app/1_domain/failures/failures.dart';
import 'package:adviser_app/1_domain/usecases/advise_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'adviser_cubit_state.dart';

const String serverErrorMessage = 'Oops, there is an error with the API';
const String cacheErrorMessage = 'Oops, cache failed. Try again';
const String generalErrorMessage = 'Oops, something is wrong, try again';

class AdviserCubit extends Cubit<AdviserCubitState> {
  final AdviseUseCases adviseUseCases;

  AdviserCubit({required this.adviseUseCases}) : super(AdviseStateInitial());

  void adviseRequested() async {
    emit(AdviseStateLoading());
    final failureOrAdvise = await adviseUseCases.getAdvise();

    failureOrAdvise.fold(
      (failure) => emit(AdviseStateError(error: _mapFailureToMessage(failure))),
      (advise) => emit(AdviseStateLoaded(advice: advise.advise)),
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
