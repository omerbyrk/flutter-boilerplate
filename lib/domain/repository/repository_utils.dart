part of repository;

extension RepositoryUtils on Repository {
  /// [convertToEither] converts the service/datasource result into Either.
  /// If there is no error, then return Right(result)
  /// Otherwise, Left(error)
  Future<Either<Failure, T>> convertToEither<T>(
      Future<T> Function() function) async {
    try {
      return Right(await function());
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }

  /// [isDeviceOnline] returns true, If device connected to the internet
  /// It uses [ConnectivityUtils] in it.
  Future<bool> get isDeviceOnline async =>
      ConnectivityResult.none != await d.connectivityUtils.isDeviceOnline;
}
