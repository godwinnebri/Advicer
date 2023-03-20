import 'package:adviser_app/0_data/repositories/advise_repo_implementation.dart';
import 'package:adviser_app/1_domain/entities/advise_entites.dart';
import 'package:adviser_app/1_domain/failures/failures.dart';
import 'package:adviser_app/2_application/pages/advice/cubit/adviser_cubit_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class AdviseUseCases {
  final adviseRepo = AdviseRepoImpl();
  Future<Either<Failure, AdviceEntity>> getAdvise() async {
    return adviseRepo.getAdviseFromDataSource();
  }
}
