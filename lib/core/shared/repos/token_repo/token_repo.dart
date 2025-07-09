import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failuer.dart';
import 'package:flutter/material.dart';

abstract class TokenRepo {
  Future<Either<Failure, String>> getToken(BuildContext context);
}
