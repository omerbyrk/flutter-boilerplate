// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/blocs/authentication/authentication_bloc.dart';
import 'core/blocs/bootstart/bootstart_bloc.dart';
import 'core/utils/connectivity_utils.dart';
import 'data/local/datasources/movie_local_datasource.dart';
import 'data/local/datasources/user_local_datasource.dart';
import 'data/network/datasources/movie_omdb_datasource.dart';
import 'data/sharedpref/datasources/authentication_datasource.dart';
import 'domain/repository/repository.dart';
import 'domain/usecases/authentication/clear_token.dart';
import 'domain/usecases/user/get_user_by_token.dart';
import 'domain/usecases/authentication/get_token.dart';
import 'domain/usecases/authentication/is_authenticated_user.dart';
import 'domain/usecases/authentication/set_token.dart';
import 'domain/usecases/movie/get_local_movie_list.dart';
import 'domain/usecases/movie/get_movie_by_imdb_id.dart';
import 'domain/usecases/movie/get_movie_by_title.dart';
import 'domain/usecases/movie/is_local_movie_empty.dart';
import 'domain/usecases/movie/movie_bootstart_sync.dart';
import 'domain/usecases/movie/search_movie_by_title.dart';
import 'domain/usecases/user/do_login.dart';
import 'presentations/home/bloc/home_bloc.dart';
import 'presentations/login/bloc/login_bloc.dart';
import 'presentations/login/cubit/login_form_field_cubit.dart';
import 'presentations/splash/cubit/splash_cubit.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<AuthenticationDataSource>(() =>
      AuthenticationDataSource(sharedPreferences: get<SharedPreferences>()));
  gh.lazySingleton<ClearUserToken>(() => ClearUserToken(repository: get()));
  gh.lazySingleton<DoLogin>(() => DoLogin(repository: get()));
  gh.lazySingleton<GetUserByToken>(() => GetUserByToken(repository: get()));
  gh.lazySingleton<GetMovieByImdbID>(() => GetMovieByImdbID(repository: get()));
  gh.lazySingleton<GetMovieByTitle>(() => GetMovieByTitle(repository: get()));
  gh.lazySingleton<GetLocalMovieList>(
      () => GetLocalMovieList(repository: get()));
  gh.lazySingleton<GetUserToken>(() => GetUserToken(repository: get()));
  gh.lazySingleton<IsAuthenticatedUser>(
      () => IsAuthenticatedUser(repository: get()));
  gh.lazySingleton<IsLocalMovieEmpty>(
      () => IsLocalMovieEmpty(repository: get()));
  gh.factory<LoginFormFieldCubit>(() => LoginFormFieldCubit());
  gh.lazySingleton<MovieBootstartSync>(
      () => MovieBootstartSync(repository: get()));
  gh.lazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSource(database: get<Database>()));
  gh.lazySingleton<MovieOmdbDataSource>(() => MovieOmdbDataSource());
  gh.lazySingleton<SearchMovieByTitle>(
      () => SearchMovieByTitle(repository: get()));
  gh.lazySingleton<SetUserToken>(() => SetUserToken(repository: get()));
  gh.factory<SplashCubit>(() => SplashCubit());
  gh.lazySingleton<UserLocalDataSource>(
      () => UserLocalDataSource(database: get<Database>()));
  gh.lazySingleton<AuthenticationBloc>(() => AuthenticationBloc(
        getAuthenticatedUser: get<GetUserByToken>(),
        getUserToken: get<GetUserToken>(),
        clearUserToken: get<ClearUserToken>(),
      ));
  gh.lazySingleton<BootStartBloc>(() => BootStartBloc(
        connectivityUtils: get<ConnectivityUtils>(),
        isAuthenticatedUser: get<IsAuthenticatedUser>(),
        getToken: get<GetUserToken>(),
        getAuthenticatedUser: get<GetUserByToken>(),
        isLocalMovieEmpty: get<IsLocalMovieEmpty>(),
        movieBootstartSync: get<MovieBootstartSync>(),
      ));
  gh.lazySingleton<HomeBloc>(() => HomeBloc(
      getLocalMovieList: get<GetLocalMovieList>(),
      searchMovieByTitle: get<SearchMovieByTitle>()));
  gh.factory<LoginBloc>(
      () => LoginBloc(doLogin: get<DoLogin>(), setToken: get<SetUserToken>()));
  gh.lazySingleton<RepositoryDependencies>(() => RepositoryDependencies(
        connectivityUtils: get<ConnectivityUtils>(),
        authenticationDataSource: get<AuthenticationDataSource>(),
        userLocalDataSource: get<UserLocalDataSource>(),
        movieOmdbDataSource: get<MovieOmdbDataSource>(),
        movieLocalDataSource: get<MovieLocalDataSource>(),
      ));
  gh.lazySingleton<Repository>(
      () => Repository(d: get<RepositoryDependencies>()));
  return get;
}
