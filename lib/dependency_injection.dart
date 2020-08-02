import 'package:covid19_app/domain/usecases/user/get_by_token.dart';
import 'package:covid19_app/presentations/login/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './data/locale/db_consts.dart' as DBConsts;
import 'core/blocs/authentication/authentication_bloc.dart';
import 'core/blocs/bootstart/bootstart_bloc.dart';
import 'data/locale/datasources/user_local_datasource.dart';
import 'domain/repositories/user/user_repository.dart';
import 'domain/usecases/user/do_login.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => LoginBloc(doLogin: sl()));
  sl.registerLazySingleton(
      () => AuthenticationBloc(getByToken: sl()));
  sl.registerLazySingleton(() => BootstartBloc(authenticationBloc: sl()));

  // use cases
  sl.registerLazySingleton(
      () => DoLogin(userRepository: sl<UserRepositoryImpl>()));
  sl.registerLazySingleton(
      () => GetByToken(userRepository: sl<UserRepositoryImpl>()));

  // repository
  sl.registerLazySingleton(
      () => UserRepositoryImpl(localDataSource: sl<UserLocalDataSource>()));

  // datasources
  sl.registerLazySingleton(() => UserLocalDataSource(database: sl()));

  // common
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerFactory(() => sharedPreferences);

  // Database
  final appDocumentDir = await getApplicationDocumentsDirectory();
  final dbPath = join(appDocumentDir.path, DBConsts.DB_NAME);
  Database database = await databaseFactoryIo.openDatabase(dbPath);
  sl.registerLazySingleton(() => database);
}
