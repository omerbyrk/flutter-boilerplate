import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/failures/failure.dart';
import '../../repository/repository.dart';
import '../usecase.dart';

/// [MovieBootstartSync] add local db the [synchronizedMovies] if there is no movie-data on local.
@lazySingleton
class MovieBootstartSync implements UseCase<bool, NoParams> {
  Repository repository;

  /// the movie titles which is fetched from the api, and added to local db.
  List<String> synchronizedMovies = [
    "The Pianist",
    "Amelie",
    "Life is Beautiful",
    "Sin City",
    "Black Swan",
    "King's Speech",
    "District 9",
    "The Girl with the Dragon Tattoo",
    "The Truman Show",
    "A Beautiful Mind",
    "Shutter Island",
    "Big Fish",
    "Hugo"
  ];
  MovieBootstartSync({@required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    for (var title in synchronizedMovies) {
      var result = await repository
          .getMovieByTitle(title); // for saving the movie to local
      if (result.isLeft()) {
        return result.map<bool>((r) => false);
      }
    }
    return Right(true);
  }
}
