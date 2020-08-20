import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/failures/failure.dart';
import '../../entities/movie_entity.dart';
import '../../repository/repository.dart';
import '../usecase.dart';

/// [GetMovieByTitle] get movie by title
@lazySingleton
class GetMovieByTitle implements UseCase<MovieEntity, Params> {
  Repository repository;

  GetMovieByTitle({@required this.repository});

  @override
  Future<Either<Failure, MovieEntity>> call(Params params) async {
    return await repository.getMovieByTitle(params.title);
  }
}

class Params {
  final String title;

  Params(this.title);
}
