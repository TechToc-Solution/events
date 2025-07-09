import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:events/core/locale/locale_cubit.dart';
import 'package:events/core/shared/repos/token_repo/token_repo.dart';
import 'package:events/core/utils/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Api_services/api_services.dart';
import '../../../Api_services/urls.dart';
import '../../../errors/error_handler.dart';
import '../../../errors/failuer.dart';

class TokenRepoIplm implements TokenRepo {
  final ApiServices _apiServices;

  TokenRepoIplm(this._apiServices);

  @override
  Future<Either<Failure, String>> getToken(BuildContext context) async {
    try {
      final localeCubit = context.read<LocaleCubit>();
      final currentLang = localeCubit.currentLocale.languageCode;

      log(currentLang);
      var resp = await _apiServices.post(
        endPoint: "${Urls.getToken}?json=",
        data: {"lang": currentLang, "platform": 1, "id": 1},
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
