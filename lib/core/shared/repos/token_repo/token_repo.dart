import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failuer.dart';

abstract class TokenRepo {
  Future<Either<Failure, String>> getToken();
}
