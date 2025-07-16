import 'package:dartz/dartz.dart';
import 'package:events/core/Api_services/api_services.dart';
import 'package:events/core/Api_services/urls.dart';
import 'package:events/core/errors/error_handler.dart';
import 'package:events/core/errors/failuer.dart';
import 'package:events/core/utils/cache_helper.dart';
import 'package:events/features/group_details/data/repo/player_selection_repo.dart';
import 'package:events/features/group_details/presentation/params/player_selection_params.dart';

class PlayerSelectionRepoIplm implements PlayerSelectionRepo {
  final ApiServices apiServices;

  PlayerSelectionRepoIplm({required this.apiServices});
  @override
  Future<Either<Failure, void>> playerSelection(
    PlayerSelectionParams params,
  ) async {
    try {
      var resp = await apiServices.post(
        endPoint:
            "${Urls.selectionSubmit}?token=${CacheHelper.getData(key: "token")}",
        data: {
          "data":
              "{'group': ${params.groupId},'players': ${params.playerId},'note': ${params.notes}},",
        },
      );
      if (resp.statusCode == 200) {
        return right(null);
      }
      return left(
        ServerFailure(resp.data['message'] ?? ErrorHandler.defaultMessage()),
      );
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
