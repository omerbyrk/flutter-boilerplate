import 'package:connectivity/connectivity.dart';
import 'package:covid19_app/domain/usecases/movie/clear_local_movie_list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/blocs/authentication/authentication_bloc.dart';
import 'core/blocs/bootstart/bootstart_bloc.dart';
import 'core/localization/app_localizations.dart';
import 'core/utils/connectivity_utils.dart';
import 'core/utils/screen_utils.dart';
import 'data/local/datasources/movie_local_datasource.dart';
import 'data/local/datasources/user_local_datasource.dart';
import 'data/local/local_consts.dart';
import 'data/network/datasources/movie_omdb_datasource.dart';
import 'data/sharedpref/datasources/authentication_datasource.dart';
import 'domain/repository/index.dart';
import 'domain/usecases/authentication/clear_token.dart';
import 'domain/usecases/authentication/get_authenticated_user.dart';
import 'domain/usecases/authentication/get_token.dart';
import 'domain/usecases/authentication/is_authenticated_user.dart';
import 'domain/usecases/authentication/set_token.dart';
import 'domain/usecases/movie/get_local_movie_list.dart';
import 'domain/usecases/movie/get_omdb_movie_by_imdbid.dart';
import 'domain/usecases/movie/get_omdb_movie_by_title.dart';
import 'domain/usecases/movie/is_local_movie_empty.dart';
import 'domain/usecases/movie/movie_bootstart_sync.dart';
import 'domain/usecases/user/do_login.dart';
import 'domain/usecases/user/get_by_token.dart';
import 'presentations/home/bloc/home_bloc.dart';
import 'presentations/login/bloc/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Bloc
  sl.registerFactory(() => LoginBloc(doLogin: sl(), setToken: sl()));
  sl.registerLazySingleton(() => HomeBloc(getLocalMovieList: sl()));
  sl.registerLazySingleton(() => AuthenticationBloc(
      getAuthenticatedUser: sl(), getUserToken: sl(), clearUserToken: sl()));
  sl.registerLazySingleton(() => BootstartBloc(
      connectivityUtils: sl(),
      isAuthenticatedUser: sl(),
      getAuthenticatedUser: sl(),
      getToken: sl(),
      isLocalMovieEmpty: sl(),
      movieBootstartSync: sl()));

  //! use cases
  sl.registerLazySingleton(() => DoLogin(repository: sl()));
  sl.registerLazySingleton(() => GetByToken(repository: sl()));
  sl.registerLazySingleton(() => GetAuthenticatedUser(repository: sl()));
  sl.registerLazySingleton(() => SetToken(repository: sl()));
  sl.registerLazySingleton(() => GetUserToken(repository: sl()));
  sl.registerLazySingleton(() => IsAuthenticatedUser(repository: sl()));
  sl.registerLazySingleton(() => ClearUserToken(repository: sl()));
  sl.registerLazySingleton(() => GetLocalMovieList(repository: sl()));
  sl.registerLazySingleton(() => GetOmdbMovieByImdbID(repository: sl()));
  sl.registerLazySingleton(() => GetOmdbMovieByTitle(repository: sl()));
  sl.registerLazySingleton(() => IsLocalMovieEmpty(repository: sl()));
  sl.registerLazySingleton(() => MovieBootstartSync(repository: sl()));
  sl.registerLazySingleton(() => ClearLocalMovieList(repository: sl()));

  //! repository
  sl.registerLazySingleton(() => Repository(
      d: RepositoryDependencies(
          connectivityUtils: sl(),
          authenticationDataSource: sl(),
          userLocalDataSource: sl(),
          movieOmdbDataSource: sl(),
          movieLocalDataSource: sl())));

  //! datasources
  sl.registerLazySingleton(() => UserLocalDataSource(database: sl()));
  sl.registerLazySingleton(
      () => AuthenticationDataSource(sharedPreferences: sl()));
  sl.registerLazySingleton(() => MovieOmdbDataSource());
  sl.registerLazySingleton(() => MovieLocalDataSource(database: sl()));

  //! common - utils
  sl.registerLazySingleton(
      () => ConnectivityUtils(connectivity: Connectivity()));

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerFactory(() => sharedPreferences);

  final appDocumentDir = await getApplicationDocumentsDirectory();
  final dbPath = join(appDocumentDir.path, LocalConsts.DB_NAME);
  Database database = await databaseFactoryIo.openDatabase(dbPath);
  sl.registerLazySingleton(() => database);
}

void registerLocalizations(BuildContext context) {
  if (!sl.isRegistered<AppLocalizations>())
    sl.registerLazySingleton(() => AppLocalizations.of(context));
}

void registerScreenUtils(BuildContext context) {
  if (!sl.isRegistered<ScreenUtils>()) {
    ScreenUtils screenUtils = ScreenUtils();
    screenUtils.init(context);

    sl.registerLazySingleton(() => screenUtils);
  }
}
