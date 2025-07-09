import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failuer.dart';
import '../../model/home_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeData>> getHome();
}
