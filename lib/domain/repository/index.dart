library repository;

import 'package:connectivity/connectivity.dart';
import 'package:flutmovie/core/exceptions/failure.dart';
import 'package:flutmovie/core/utils/connectivity_utils.dart';
import 'package:flutmovie/data/local/datasources/movie_local_datasource.dart';
import 'package:flutmovie/data/local/datasources/user_local_datasource.dart';
import 'package:flutmovie/data/models/movie_model.dart';
import 'package:flutmovie/data/network/datasources/movie_omdb_datasource.dart';
import 'package:flutmovie/data/sharedpref/datasources/authentication_datasource.dart';
import 'package:flutmovie/domain/entities/movie_entity.dart';
import 'package:flutmovie/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

part 'authentication_repository.dart';
part 'movie_repository.dart';
part 'user_repository.dart';
part 'utils.dart';

@lazySingleton
class RepositoryDependencies {
  final ConnectivityUtils connectivityUtils;
  final AuthenticationDataSource authenticationDataSource;
  final UserLocalDataSource userLocalDataSource;
  final MovieOmdbDataSource movieOmdbDataSource;
  final MovieLocalDataSource movieLocalDataSource;

  RepositoryDependencies(
      {@required this.connectivityUtils,
      @required this.authenticationDataSource,
      @required this.userLocalDataSource,
      @required this.movieOmdbDataSource,
      @required this.movieLocalDataSource});
}

@lazySingleton
class Repository {
  RepositoryDependencies d;
  Repository({@required this.d});
}
