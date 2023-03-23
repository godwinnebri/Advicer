import 'package:adviser_app/0_data/data_sources/advise_remote_datasource.dart';
import 'package:adviser_app/0_data/repositories/advise_repo_implementation.dart';
import 'package:adviser_app/1_domain/reposiitories/advise_repo.dart';
import 'package:adviser_app/1_domain/usecases/advise_usecases.dart';
import 'package:adviser_app/2_application/pages/advice/cubit/adviser_cubit_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I; //sl is service locator

Future<void> init() async {
  //* app layer
  sl.registerFactory<AdviserCubit>(
    () => AdviserCubit(adviseUseCases: sl()),
  );

  //* Domain layer
  sl.registerFactory<AdviseUseCases>(
    () => AdviseUseCases(adviseRepo: sl()),
  );

  //* Data layer\
  sl.registerFactory<AdviseRepo>(
    () => AdviseRepoImpl(adviseRemoteDataSource: sl()),
  );

  sl.registerFactory<AdviseRemoteDataSource>(
    () => AdviseRemoteDataSourceImpl(client: sl()),
  );

  //! External
  sl.registerFactory(() => http.Client);
}
