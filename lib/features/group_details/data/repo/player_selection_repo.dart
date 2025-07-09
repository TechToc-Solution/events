import 'package:dartz/dartz.dart';
import 'package:events/core/errors/failuer.dart';
import 'package:events/features/group_details/presentation/params/player_selection_params.dart';

abstract class PlayerSelectionRepo {
  Future<Either<Failure, void>> playerSelection(PlayerSelectionParams params);
}
