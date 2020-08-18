import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/exceptions/failure.dart';
import '../../entities/movie_entity.dart';
import '../../repository/index.dart';
import '../usecase.dart';

@lazySingleton
class SearchMovieByTitle implements UseCase<List<MovieEntity>, Params> {
  Repository repository;

  SearchMovieByTitle({@required this.repository});

  @override
  Future<Either<Failure, List<MovieEntity>>> call(Params params) async {
    return await repository.searchOmdbMovieByTitle(params.title);
  }
}

class Params {
  final String title;

  Params(this.title);
}