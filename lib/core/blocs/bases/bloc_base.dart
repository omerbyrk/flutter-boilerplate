import 'package:dartz/dartz.dart';

import '../../exceptions/failure.dart';
import '../utils/enums.dart';


abstract class AppBlocBase {
  // its a optional methods
  void toOnMessageState(String message, MessageType type) {
    throw UnimplementedError("You need to override the method to use");
  }
  // its a optional methods
  void toInProgressState() {
    throw UnimplementedError("You need to override the method to use");
  }
  // If Either has failure, then it turn state to MessageState for showing an error on screeen; 
  T extractEither<T>(Either<Failure, T> either, ) {
    return either.fold<T>((l) {
      this.toOnMessageState(l.message, MessageType.ERROR);
      return null;
    }, (r) => r);
  }
}
