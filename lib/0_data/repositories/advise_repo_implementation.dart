import 'package:adviser_app/0_data/data_sources/advise_remote_datasource.dart';
import 'package:adviser_app/1_domain/failures/failures.dart';
import 'package:adviser_app/1_domain/entities/advise_entites.dart';
import 'package:adviser_app/1_domain/reposiitories/advise_repo.dart';
import 'package:dartz/dartz.dart';

class AdviseRepoImpl implements AdviseRepo {
  final AdviseRemoteDataSource adviseRemoteDataSource;
  AdviseRepoImpl({required this.adviseRemoteDataSource});

  @override
  Future<Either<Failure, AdviceEntity>> getAdviseFromDataSource() async {
    try {
      final result = await adviseRemoteDataSource.getRandomAdviseFromApi();
      return right(result);
    } on ServerError catch (_) {
      return left(ServerError());
    } catch (e) {
      return left(GeneralError());
    }
  }
}
