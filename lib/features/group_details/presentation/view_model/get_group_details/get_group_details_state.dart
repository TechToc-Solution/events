part of 'get_group_details_cubit.dart';

sealed class GetGroupDetailsState extends Equatable {
  const GetGroupDetailsState();

  @override
  List<Object> get props => [];
}

final class GetGroupDetailsInitial extends GetGroupDetailsState {}

final class GetGroupDetailsLoading extends GetGroupDetailsState {}

final class GetGroupDetailsSuccess extends GetGroupDetailsState {
  final List<GroupDetailModel> groups;

  const GetGroupDetailsSuccess({required this.groups});

  @override
  List<Object> get props => [groups];
}

final class GetGroupDetailsError extends GetGroupDetailsState {
  final String message;

  const GetGroupDetailsError({required this.message});

  @override
  List<Object> get props => [message];
}
