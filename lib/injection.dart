import 'package:adviser_app/0_data/data_sources/advise_remote_datasource.dart';
import 'package:adviser_app/0_data/repositories/advice_repo_implementation.dart';
import 'package:adviser_app/1_domain/reposiitories/advice_repo.dart';
import 'package:adviser_app/1_domain/usecases/advice_usecases.dart';
import 'package:adviser_app/2_application/pages/advice/cubit/advicer_cubit_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I; //sl is service locator

Future<void> init() async {
  //* app layer
  sl.registerFactory<AdvicerCubit>(() => AdvicerCubit(adviceUseCases: sl()));

  //* Domain layer
  sl.registerFactory<AdviceUseCases>(() => AdviceUseCases(adviceRepo: sl()));

  //* Data layer
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDatasource: sl()));

  sl.registerFactory<AdviceRemoteDataSource>(
      () => AdviceRemoteDataSourceImpl(client: sl()));

  //! External
  sl.registerFactory(() => http.Client());
}
