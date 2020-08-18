import 'package:dartz/dartz.dart';

import '../../core/failures.dart/failure.dart';

// Use caseler bloclar için iş katmanını oluşturuyor. Bu Classlar ile repositorylere bağlanıp uzun soluklu işler yapabiliriz.
// Kod tekrarını azaltır ve kodu daha okunabilir kılar
// Parameters have to be put into a container object so that they can be
// included in this abstract base class method definition.
// Usecaseleri kendi aralarında bile kullanabilirsin, birbirlerine bağımlılığı olabilir
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// This will be used by the code calling the use case whenever the use case
// doesn't accept any parameters.
class NoParams {}
