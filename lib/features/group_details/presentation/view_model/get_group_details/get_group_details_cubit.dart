import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:events/features/group_details/data/model/group_detail_model.dart';
import 'package:events/features/group_details/data/repo/group_repo.dart';

part 'get_group_details_state.dart';

class GetGroupDetailsCubit extends Cubit<GetGroupDetailsState> {
  GetGroupDetailsCubit(this.groupRepo) : super(GetGroupDetailsInitial());
  final GroupRepo groupRepo;
  void getGroupDetails(int groupId) async {
    emit(GetGroupDetailsLoading());
    final result = await groupRepo.getGroupDetails(groupId);
    result.fold(
      (failure) => emit(GetGroupDetailsError(message: failure.message)),
      (groups) => emit(GetGroupDetailsSuccess(groups: groups)),
    );
  }
}
