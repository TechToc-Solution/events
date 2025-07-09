part of 'token_cubit.dart';

@immutable
sealed class TokenState {}

final class TokenInitial extends TokenState {}

final class SuccessTokenState extends TokenState {
  final String token;

  SuccessTokenState({required this.token});
}

final class LoadingTokenState extends TokenState {}

final class ErrorTokenState extends TokenState {
  final String msg;

  ErrorTokenState({required this.msg});
}
