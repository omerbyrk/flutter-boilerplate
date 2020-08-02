import 'package:covid19_app/data/models/user_model.dart';
import 'package:covid19_app/domain/entities/user_entity.dart';

import '../../../core/exceptions/failure.dart';
import '../usecase.dart';
import '../../repositories/user/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class GetByToken implements UseCase<UserModel, Params> {
  UserRepository userRepository;

  GetByToken({@required this.userRepository});

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    return await userRepository.getByToken(params.token);
  }
}

class Params {
  final String token;

  Params(this.token);
}
