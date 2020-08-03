library repository;

import 'package:covid19_app/core/exceptions/failure.dart';
import 'package:covid19_app/data/local/datasources/user_local_datasource.dart';
import 'package:covid19_app/data/network/datasources/country_statistics_datasource.dart';
import 'package:covid19_app/data/sharedpref/datasources/AuthenticationDataSource.dart';
import 'package:covid19_app/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

part 'user_repository.dart';
part 'authentication_repository.dart';
part 'utils.dart';

class RepositoryDependencies {
  final AuthenticationDataSource authenticationDataSource;
  final UserLocalDataSource userLocalDataSource;
  final CountryStatisticsDataSource countryStatisticsDataSource;

  RepositoryDependencies(
      {@required this.authenticationDataSource,
      @required this.userLocalDataSource,
      @required this.countryStatisticsDataSource});
}

class Repository {
  RepositoryDependencies d;
  Repository({@required this.d});
}
