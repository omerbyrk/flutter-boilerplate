import 'package:dartz/dartz.dart';

import '../../../domain/repository/repository.dart';
import '../../../domain/usecases/usecase.dart';
import '../../../presentations/login/bloc/index.dart';
import '../../consts/enums.dart';
import '../../failures/failure.dart';
import 'bloc_state_base.dart';

abstract class AppBlocBase {
  /// It is a optional method.
  /// When you override [toOnMessageState], you need to change sub-bloc state to [BlocOnMessageStateBase] in the method.
  /// We use this method in [extractEither] for showing user the error If the [Either] has failure.
  /// Therefore, if you will use the [extractEither] for the sub-bloc, you must override this method.
  /// Example: [LoginBloc]
  void toOnMessageState(String message, MessageType type) {
    throw UnimplementedError(
        "You need to override the method to use(You need to turn the bloc-state BlocOnMessageStateBase Type)");
  }

  /// We always receive [Either] from [UseCase] or [Repository].
  /// If [Either] has failure, then turn state to [BlocOnMessageStateBase] for showing the error on screeen, and return [null].
  /// If not, then we extract the [T] and return it.
  T extractEither<T>(
    Either<Failure, T> either,
  ) {
    return either.fold<T>((l) {
      this.toOnMessageState(l.message, MessageType.ERROR);
      return null; // If
    }, (r) => r);
  }
}
