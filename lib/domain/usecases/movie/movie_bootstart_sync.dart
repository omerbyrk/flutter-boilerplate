import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/failures.dart/failure.dart';
import '../../repository/repository.dart';
import '../usecase.dart';

@lazySingleton
class MovieBootstartSync implements UseCase<bool, NoParams> {
  Repository repository;
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
