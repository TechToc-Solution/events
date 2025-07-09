// pay_repo_iplm.dart
import 'package:dartz/dartz.dart';
import 'package:events/core/shared/repos/token_repo/token_repo.dart';
import 'package:events/core/utils/cache_helper.dart';

import '../../../Api_services/api_services.dart';
import '../../../Api_services/urls.dart';
import '../../../errors/error_handler.dart';
import '../../../errors/failuer.dart';

class TokenRepoIplm implements TokenRepo {
  final ApiServices _apiServices;

  TokenRepoIplm(this._apiServices);

  @override
  Future<Either<Failure, String>> getToken() async {
    try {
      var resp = await _apiServices.get(
        endPoint: "${Urls.getToken}?lang=ar&platform=1&id=1&json=",
      );
      if (resp.statusCode == 200) {
        CacheHelper.setString(key: "token", value: resp.data['root']['token']);
        return right(resp.data['root']['token']);
      }
      return left(
        ServerFailure(resp.data['message'] ?? ErrorHandler.defaultMessage()),
      );
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
