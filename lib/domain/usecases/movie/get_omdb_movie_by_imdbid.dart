import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/exceptions/failure.dart';
import '../../entities/movie_entity.dart';
import '../../repository/index.dart';
import '../usecase.dart';

class GetOmdbMovieByImdbID implements UseCase<MovieEntity, Params> {
  Repository repository;

  GetOmdbMovieByImdbID({@required this.repository});

  @override
  Future<Either<Failure, MovieEntity>> call(Params params) async {
    return await repository.getOmdbMovieByImdbID(params.imdbID);
  }
}

class Params {
  final String imdbID;

  Params(this.imdbID);
}
