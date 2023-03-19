import 'package:adviser_app/1_domain/entities/advise_entites.dart';
import 'package:adviser_app/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AdviseRepo {
  Future<Either<Failure, AdviceEntity>> getAdviseFromDataSource();
}
