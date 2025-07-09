import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:events/core/Api_services/api_services.dart';
import 'package:events/core/Api_services/urls.dart';
import 'package:events/core/errors/failuer.dart';
import 'package:events/core/utils/cache_helper.dart';
import 'package:events/features/home/data/model/home_model.dart';
import 'package:events/features/home/data/repo/home/home.dart';

import '../../../../../core/errors/error_handler.dart';

class HomeRepoIplm implements HomeRepo {
  final ApiServices _apiServices;

  HomeRepoIplm(this._apiServices);
  @override
  Future<Either<Failure, HomeData>> getHome() async {
    try {
      var resp = await _apiServices.post(
        endPoint:
            "${Urls.selectionGroup}?token=${CacheHelper.getData(key: "token")}",
        data: {},
      );
      if (resp.statusCode == 200) {
        final data = resp.data;
        if (data['timer'] != null && data['timer'].isNotEmpty) {
          return right(HomeData.fromJson(data['timer'][0]));
        } else {
          return left(ServerFailure("No timer data found."));
        }
      }
      return left(
        ServerFailure(resp.data['message'] ?? ErrorHandler.defaultMessage()),
      );
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
