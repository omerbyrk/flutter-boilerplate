import '../../../core/exceptions/failure.dart';
import '../usecase.dart';
import '../../repositories/user/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class DoLogin implements UseCase<String, Params> {
  UserRepository userRepository;

  DoLogin({@required this.userRepository});

  @override
  Future<Either<Failure, String>> call(Params params) async {
    return await userRepository.login(params.username, params.password);
  }
}

class Params {
  final String username;
  final String password;

  Params(this.username, this.password);
}
