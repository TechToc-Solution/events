part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class SuccessHomeState extends HomeState {
  final HomeData data;

  SuccessHomeState({required this.data});
}

final class LoadingHomeState extends HomeState {}

final class ErrorHomeState extends HomeState {
  final String msg;

  ErrorHomeState({required this.msg});
}
