import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

import '../data/datasources/login_datasource.dart';
import '../data/datasources/register_datasource.dart';
import '../data/models/user_model.dart';
import '../data/repository/login_repository.dart';
import '../data/repository/register_repository.dart';
import '../domain/interfaces/login_contract.dart';
import '../domain/interfaces/register_contract.dart';
import '../domain/usecases/login_usecase.dart';
import '../domain/usecases/register_usecase.dart';
import '../presentation/viewmodel/bloc/authentication_bloc.dart';

final getIt = GetIt.instance;

Future<void> initAuth() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(UserModelAdapter());
  }

  await Hive.openBox<UserModel>('userBox');
  getIt.registerLazySingleton(() => AuthenticationBloc(
        getIt(),
        getIt(),
      ));

  getIt.registerLazySingleton(() => RegisterUseCase(registerContract: getIt()));

  getIt.registerLazySingleton<RegisterDatasource>(
      () => RegisterDatasourceImpl());

  getIt.registerLazySingleton<RegisterContract>(
      () => RegisterRepository(registerDatasource: getIt()));
  getIt.registerLazySingleton(() => LoginUseCase(loginContract: getIt()));
  getIt.registerLazySingleton<LoginDatasource>(() => LoginDatasourceImpl());
  getIt.registerLazySingleton<LoginContract>(
      () => LoginRepository(loginDatasource: getIt()));
}
