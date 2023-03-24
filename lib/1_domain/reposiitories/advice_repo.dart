import 'package:adviser_app/1_domain/entities/advice_entites.dart';
import 'package:adviser_app/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AdviceRepo {
  Future<Either<Failure, AdviceEntity>> getAdviseFromDataSource();
}
