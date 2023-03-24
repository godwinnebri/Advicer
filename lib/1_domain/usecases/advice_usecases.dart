import 'package:adviser_app/0_data/repositories/advice_repo_implementation.dart';
import 'package:adviser_app/1_domain/entities/advice_entites.dart';
import 'package:adviser_app/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  AdviceUseCases({required this.adviceRepo});
  final AdviceRepoImpl adviceRepo;

  Future<Either<Failure, AdviceEntity>> getAdvise() async {
    return adviceRepo.getAdviseFromDataSource();
  }
}
