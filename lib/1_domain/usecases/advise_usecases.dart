import 'package:adviser_app/1_domain/entities/advise_entites.dart';
import 'package:adviser_app/1_domain/failures/failures.dart';
import 'package:adviser_app/2_application/pages/advice/cubit/adviser_cubit_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class AdviseUseCases {
  Future<Either<Failure, AdviceEntity>> getAdvise() async {
    //get an advise
    await Future.delayed(const Duration(seconds: 3), () {});
    // return right(const AdviceEntity(advise: 'advise to test', id: 1));
    return left(CacheError());
  }
}
