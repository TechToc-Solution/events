import 'package:dartz/dartz.dart';
import 'package:events/core/errors/error_handler.dart';
import 'package:events/core/errors/failuer.dart';
import 'package:events/core/shared/repos/token_repo/token_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'token_state.dart';

class TokenCubit extends Cubit<TokenState> {
  TokenCubit(this._TokenRepo) : super(TokenInitial());
  final TokenRepo _TokenRepo;
  Future<void> getToken(BuildContext context) async {
    emit(LoadingTokenState());

    try {
      final Either<Failure, String> result = await _TokenRepo.getToken(context);

      result.fold(
        (failure) {
          emit(ErrorTokenState(msg: failure.message));
        },
        (token) {
          emit(SuccessTokenState(token: token));
        },
      );
    } catch (e) {
      emit(ErrorTokenState(msg: ErrorHandler.defaultMessage()));
    }
  }
}
