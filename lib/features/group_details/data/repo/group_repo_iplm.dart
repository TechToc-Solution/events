import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:events/core/Api_services/api_services.dart';
import 'package:events/core/Api_services/urls.dart';
import 'package:events/core/errors/error_handler.dart';
import 'package:events/core/errors/failuer.dart';
import 'package:events/core/utils/cache_helper.dart';
import 'package:events/features/group_details/data/repo/group_repo.dart';
import 'package:events/features/group_details/data/model/group_detail_model.dart';

class GroupRepoIplm implements GroupRepo {
  final ApiServices apiServices;

  GroupRepoIplm({required this.apiServices});
  @override
  Future<Either<Failure, List<GroupDetailModel>>> getGroupDetails(int groupId) async {
    try {
      var resp = await apiServices.post(
        endPoint: "${Urls.selectionPersons}?token=${CacheHelper.getData(key: "token")}",
        data: {"group": groupId},
      );
      if (resp.statusCode == 200) {
        final jsonList = jsonDecode(resp.data) as List<dynamic>;
        List<GroupDetailModel> groups = jsonList.map((item) => GroupDetailModel.fromJson(item)).toList();
        return right(groups);
      }
      return left(ServerFailure(resp.data['message'] ?? ErrorHandler.defaultMessage()));
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
