import 'package:adviser_app/0_data/data_sources/advise_remote_datasource.dart';
import 'package:adviser_app/1_domain/failures/failures.dart';
import 'package:adviser_app/1_domain/entities/advice_entites.dart';
import 'package:adviser_app/1_domain/reposiitories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDataSource adviceRemoteDataSource;
  AdviceRepoImpl({required this.adviceRemoteDataSource});

  @override
  Future<Either<Failure, AdviceEntity>> getAdviseFromDataSource() async {
    try {
      final result = await adviceRemoteDataSource.getRandomAdviseFromApi();
      return right(result);
    } on ServerError catch (_) {
      return left(ServerError());
    } catch (e) {
      return left(GeneralError());
    }
  }
}
