import 'package:adviser_app/0_data/repositories/advise_repo_implementation.dart';
import 'package:adviser_app/1_domain/entities/advise_entites.dart';
import 'package:adviser_app/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviseUseCases {
  AdviseUseCases({required this.adviseRepo});
  final AdviseRepoImpl adviseRepo;

  Future<Either<Failure, AdviceEntity>> getAdvise() async {
    return adviseRepo.getAdviseFromDataSource();
  }
}
