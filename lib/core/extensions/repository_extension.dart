import 'package:covid19_app/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';

import '../domain_bases/repository.dart';

extension RepositoryExtension on Repository {
  Future<Either<Failure, T>> run<T>(Future<T> Function() function) async {
    try {
      return Right(await function());
    } catch (err) {
      return Left(Failure(message: err.message));
    }
  }
}
