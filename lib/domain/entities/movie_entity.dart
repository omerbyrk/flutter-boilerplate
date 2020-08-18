import '../../data/models/movie_model.dart';

class MovieEntity extends MovieModel {
  MovieEntity();
  factory MovieEntity.fromModel(MovieModel model) => MovieEntity()
    ..title = model.title
    ..year = model.year
    ..rated = model.rated
    ..released = model.released
    ..runtime = model.runtime //
    ..genre = model.genre
    ..director = model.director //
    ..writer = model.writer
    ..actors = model.actors
    ..plot = model.plot
    ..language = model.language
    ..country = model.country //
    ..poster = model.poster
    ..imdbID = model.imdbID;
}
