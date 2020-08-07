import 'package:covid19_app/core/utils/screen_utils.dart';
import 'package:covid19_app/data/network/datasources/country_statistics_datasource.dart';
import 'package:covid19_app/domain/repository/index.dart';
import 'package:covid19_app/domain/usecases/authentication/clear_token.dart';
import 'package:covid19_app/domain/usecases/authentication/is_authenticated_user.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/blocs/authentication/authentication_bloc.dart';
import 'core/blocs/bootstart/bootstart_bloc.dart';
import 'data/local/datasources/user_local_datasource.dart';
import 'data/local/local_consts.dart';
import 'data/sharedpref/datasources/AuthenticationDataSource.dart';
import 'domain/usecases/authentication/get_authenticated_user.dart';
import 'domain/usecases/authentication/get_token.dart';
import 'domain/usecases/authentication/set_token.dart';
import 'domain/usecases/user/do_login.dart';
import 'domain/usecases/user/get_by_token.dart';
import 'presentations/login/bloc/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Bloc
  sl.registerFactory(() => LoginBloc(doLogin: sl(), setToken: sl()));
  sl.registerLazySingleton(() => AuthenticationBloc(
      getAuthenticatedUser: sl(), getToken: sl(), clearUserToken: sl()));
  sl.registerLazySingleton(() => BootstartBloc(
      isAuthenticatedUser: sl(), getAuthenticatedUser: sl(), getToken: sl()));

  //! use cases
  sl.registerLazySingleton(() => DoLogin(repository: sl()));
  sl.registerLazySingleton(() => GetByToken(repository: sl()));
  sl.registerLazySingleton(() => GetAuthenticatedUser(repository: sl()));
  sl.registerLazySingleton(() => SetToken(repository: sl()));
  sl.registerLazySingleton(() => GetToken(repository: sl()));
  sl.registerLazySingleton(() => IsAuthenticatedUser(repository: sl()));
  sl.registerLazySingleton(() => ClearUserToken(repository: sl()));

  //! repository
  sl.registerLazySingleton(() => Repository(
      d: RepositoryDependencies(
          authenticationDataSource: sl(),
          userLocalDataSource: sl(),
          countryStatisticsDataSource: sl())));

  //! datasources
  sl.registerLazySingleton(() => UserLocalDataSource(database: sl()));
  sl.registerLazySingleton(
      () => AuthenticationDataSource(sharedPreferences: sl()));
  sl.registerLazySingleton(() => CountryStatisticsDataSource());

  //! common - utils
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerFactory(() => sharedPreferences);

  final appDocumentDir = await getApplicationDocumentsDirectory();
  final dbPath = join(appDocumentDir.path, LocalConsts.DB_NAME);
  Database database = await databaseFactoryIo.openDatabase(dbPath);
  sl.registerLazySingleton(() => database);

  sl.registerLazySingleton(() => ScreenUtils());
}
