import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/failures/failure.dart';
import '../../entities/movie_entity.dart';
import '../../repository/repository.dart';
import '../usecase.dart';

/// [SearchMovieByTitle] searchs  movies with [title] condition from repository.
@lazySingleton
class SearchMovieByTitle implements UseCase<List<MovieEntity>, Params> {
  Repository repository;

  SearchMovieByTitle({@required this.repository});

  @override
  Future<Either<Failure, List<MovieEntity>>> call(Params params) async {
    return await repository.searchMovieByTitle(params.title);
  }
}

class Params {
  /// dsad
  final String title;

  Params(this.title);
}
