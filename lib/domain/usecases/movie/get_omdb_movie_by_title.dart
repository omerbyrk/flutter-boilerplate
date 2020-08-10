import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/exceptions/failure.dart';
import '../../entities/movie_entity.dart';
import '../../repository/index.dart';
import '../usecase.dart';

class GetOmdbMovieByTitle implements UseCase<MovieEntity, Params> {
  Repository repository;

  GetOmdbMovieByTitle({@required this.repository});

  @override
  Future<Either<Failure, MovieEntity>> call(Params params) async {
    return await repository.getOmdbMovieByTitle(params.title);
  }
}

class Params {
  final String title;

  Params(this.title);
}
