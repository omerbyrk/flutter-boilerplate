import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/failures/failure.dart';
import '../../entities/movie_entity.dart';
import '../../repository/repository.dart';
import '../usecase.dart';

/// [GetMovieByImdbID] get movie by imdb id
@lazySingleton
class GetMovieByImdbID implements UseCase<MovieEntity, Params> {
  Repository repository;

  GetMovieByImdbID({@required this.repository});

  @override
  Future<Either<Failure, MovieEntity>> call(Params params) async {
    return await repository.getMovieByImdbID(params.imdbID);
  }
}

class Params {
  final String imdbID;

  Params(this.imdbID);
}
