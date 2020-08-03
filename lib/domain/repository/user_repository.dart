part of repository;

extension UserRepository on Repository {
  Future<Either<Failure, String>> login(String username, String password) {
    return this.convertToEither<String>(() async {
      return await this.d.userLocalDataSource.login(username, password);
    });
  }

  @override
  Future<Either<Failure, UserEntity>> getByToken(String token) {
    return this.convertToEither<UserEntity>(() async {
      return UserEntity.fromModel(
          await this.d.userLocalDataSource.getByToken(token));
    });
  }
}
