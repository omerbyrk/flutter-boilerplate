import 'package:covid19_app/core/blocs/authentication/authentication_bloc.dart';
import 'package:covid19_app/core/blocs/bootstart/bootstart_bloc.dart';
import 'package:covid19_app/core/datasources/locale/user_local_datasource_impl.dart';
import 'package:covid19_app/features/login/domain/repositories/login_repository.dart';
import 'package:covid19_app/features/login/presentation/bloc/index.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/login/domain/usecases/DoLogin.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => LoginBloc(doLogin: sl()));
  sl.registerLazySingleton(
      () => AuthenticationBloc(userDataSource: sl<UserLocalDataSourceImpl>()));
  sl.registerLazySingleton(() => BootstartBloc(authenticationBloc: sl()));

  // use cases
  sl.registerLazySingleton(
      () => DoLogin(loginRepository: sl<LoginRepositoryImpl>()));

  // repository
  sl.registerLazySingleton(
      () => LoginRepositoryImpl(userDataSource: sl<UserLocalDataSourceImpl>()));

  // datasources
  sl.registerLazySingleton(
      () => UserLocalDataSourceImpl(sharedPreferences: sl()));

  // common
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerFactory(() => sharedPreferences);
}
