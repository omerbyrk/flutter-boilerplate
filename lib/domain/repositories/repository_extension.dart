import 'package:covid19_app/core/exceptions/failure.dart';
import 'package:covid19_app/data/exceptions/local_server_exception.dart';
import 'package:covid19_app/data/exceptions/remote_server_exception.dart';
import 'package:dartz/dartz.dart';

import 'repository.dart';

extension RepositoryExtension on Repository {
  Future<Either<Failure, T>> convertToEither<T>(Future<T> Function() function) async {
    try {
      return Right(await function());
    } on LocalServerException catch (err) {
      return Left(Failure(message: err.message));
    } on RemoteServerException catch (err) {
      return Left(Failure(message: err.message));
    } catch (err) {
      return Left(Failure(message: err.toString()));
    }
  }
}
