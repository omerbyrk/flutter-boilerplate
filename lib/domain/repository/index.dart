library repository;

import 'package:connectivity/connectivity.dart';
import 'package:covid19_app/core/exceptions/failure.dart';
import 'package:covid19_app/core/utils/connectivity_utils.dart';
import 'package:covid19_app/data/local/datasources/movie_local_datasource.dart';
import 'package:covid19_app/data/local/datasources/user_local_datasource.dart';
import 'package:covid19_app/data/models/movie_model.dart';
import 'package:covid19_app/data/network/datasources/movie_omdb_datasource.dart';
import 'package:covid19_app/data/sharedpref/datasources/authentication_datasource.dart';
import 'package:covid19_app/domain/entities/movie_entity.dart';
import 'package:covid19_app/domain/entities/user_entity.dart';
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
