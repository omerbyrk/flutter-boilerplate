part of repository;

extension RepositoryUtils on Repository {
  //! Utils
  Future<Either<Failure, T>> convertToEither<T>(
      Future<T> Function() function) async {
    try {
      return Right(await function());
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }
}