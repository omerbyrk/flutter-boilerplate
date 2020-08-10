import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

import '../../exceptions/local_server_exception.dart';
import '../../models/movie_model.dart';
import '../../network/datasources/movie_omdb_datasource.dart';
import '../local_consts.dart';

class MovieLocalDataSource extends IMovieDataSource {
  final _moviesStore = intMapStoreFactory.store(LocalConsts.MOVIE_STORE_NAME);
  final Database database;

  MovieLocalDataSource({@required this.database});

  @override
  Future<MovieModel> getByImdbID(String imdbID) async {
    try {
      final finder = Finder(filter: Filter.equals("imdbId", imdbID));
      final recordSnapshot =
          await _moviesStore.findFirst(database, finder: finder);

      if (recordSnapshot == null) {
        return null;
      }

      return MovieModel.fromMap(recordSnapshot.value);
    } catch (err) {
      throw LocalServerException(err);
    }
  }

  @override
  Future<MovieModel> getByTitle(String title) async {
    try {
      final finder = Finder(filter: Filter.equals("title", title));
      final recordSnapshot =
          await _moviesStore.findFirst(database, finder: finder);
      if (recordSnapshot == null) {
        return null;
      }
      return MovieModel.fromMap(recordSnapshot.value);
    } catch (err) {
      throw LocalServerException(err);
    }
  }

  Future<List<MovieModel>> getList() async {
    try {
      final recordSnapshots = await _moviesStore.find(database);
      return recordSnapshots.map((e) => MovieModel.fromMap(e.value)).toList();
    } catch (err) {
      throw LocalServerException(err);
    }
  }

  Future<void> save(MovieModel movieModel) async {
    try {
      if (await getByImdbID(movieModel.imdbID) == null) {
        await _moviesStore.add(database, movieModel.toMap());
      }
    } catch (err) {
      throw LocalServerException(err);
    }
  }

  Future<bool> get isEmpty async {
    try {
      int count = await _moviesStore.count(database);
      return count < 10;
    } catch (err) {
      throw LocalServerException(err);
    }
  }

  Future<bool> clear() async {
    try {
      int count = await _moviesStore.delete(database);
      return count > 0;
    } catch (err) {
      throw LocalServerException(err);
    }
  }
}
