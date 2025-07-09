import 'package:events/core/errors/failuer.dart';
import 'package:events/features/group_details/data/model/group_detail_model.dart';
import 'package:dartz/dartz.dart';

abstract class GroupRepo {
  Future<Either<Failure, List<GroupDetailModel>>> getGroupDetails(int groupId);
}
