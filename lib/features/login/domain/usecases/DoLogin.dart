import '../../../../core/exceptions/failure.dart';
import '../../../../core/domain_bases/usecase.dart';
import '../repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class DoLogin implements UseCase<String, Params> {
  LoginRepository loginRepository;

  DoLogin({@required this.loginRepository});

  @override
  Future<Either<Failure, String>> call(Params params) async {
    return await loginRepository.login(params.username, params.password);
  }
}

class Params {
  final String username;
  final String password;

  Params(this.username, this.password);
}
