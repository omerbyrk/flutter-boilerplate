part of repository;

extension AuthenticationRepository on Repository {
  Future<Either<Failure, String>> getToken() {
    return this.convertToEither<String>(
        () => this.d.authenticationDataSource.getToken());
  }

  Future<Either<Failure, void>> setToken(String token) {
    return this.convertToEither<void>(
        () => this.d.authenticationDataSource.saveToken(token));
  }

  Future<Either<Failure, bool>> hasToken() {
    return this.convertToEither<bool>(
        () => this.d.authenticationDataSource.hasToken());
  }

  Future<Either<Failure, bool>> clearToken() {
    return this.convertToEither<bool>(
        () => this.d.authenticationDataSource.clearToken());
  }
}
