part of repository;

extension MovieRepository on Repository {
  Future<Either<Failure, MovieEntity>> getMovieByTitle(String title) async {
    if (await isDeviceOnline) {
      // device is online -- we will fetch it from api
      return await this.convertToEither<MovieEntity>(() async {
        MovieModel movieModel = await d.movieOmdbDataSource.getByTitle(title);
        await d.movieLocalDataSource.save(movieModel);
        return MovieEntity.fromModel(movieModel);
      });
    } else {
      // device is ofline -- we will fetch it from local
      return await this.convertToEither<MovieEntity>(() async {
        MovieModel movieModel = await d.movieLocalDataSource.getByTitle(title);
        return MovieEntity.fromModel(movieModel);
      });
    }
  }

  Future<Either<Failure, MovieEntity>> getMovieByImdbID(String imdbID) async {
    if (await isDeviceOnline) {
      // device is online -- we will fetch it from api
      return await this.convertToEither<MovieEntity>(() async {
        MovieModel movieModel = await d.movieOmdbDataSource.getByImdbID(imdbID);
        await d.movieLocalDataSource.save(movieModel);
        return MovieEntity.fromModel(movieModel);
      });
    } else {
      // device is ofline -- we will fetch it from local
      return await this.convertToEither<MovieEntity>(() async {
        MovieModel movieModel =
            await d.movieLocalDataSource.getByImdbID(imdbID);
        return MovieEntity.fromModel(movieModel);
      });
    }
  }

  Future<Either<Failure, List<MovieEntity>>> getLocalMovieList() async {
    return await this.convertToEither<List<MovieEntity>>(() async {
      List<MovieModel> movieModelList = await d.movieLocalDataSource.getList();
      if (movieModelList != null) {
        return movieModelList
            .map((movieModel) => MovieEntity.fromModel(movieModel))
            .toList();
      } else {
        return null;
      }
    });
  }

  Future<Either<Failure, bool>> isLocalMovieEmpty() async {
    return await this.convertToEither<bool>(() async {
      return await d.movieLocalDataSource.isEmpty;
    });
  }

  Future<Either<Failure, List<MovieEntity>>> searchMovieByTitle(
      String title) async {
    if (await isDeviceOnline) {
      return this.convertToEither<List<MovieEntity>>(() async {
        List<MovieModel> movieModels =
            await d.movieOmdbDataSource.searchByTitle(title);

        await d.movieLocalDataSource.saveList(movieModels);
        return movieModels
            .map((model) => MovieEntity.fromModel(model))
            .toList();
      });
    } else {
      return this.convertToEither<List<MovieEntity>>(() async {
        List<MovieModel> movieModels =
            await d.movieLocalDataSource.searchByTitle(title);

        return movieModels
            .map((model) => MovieEntity.fromModel(model))
            .toList();
      });
    }
  }
}
