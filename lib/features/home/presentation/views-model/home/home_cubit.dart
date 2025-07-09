import 'package:events/core/errors/error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:events/features/home/data/model/home_model.dart';
import 'package:events/features/home/data/repo/home/home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepo _homeRepo;

  Future<void> getHome() async {
    emit(LoadingHomeState());
    try {
      final result = await _homeRepo.getHome();

      result.fold(
        (failure) {
          emit(ErrorHomeState(msg: failure.message));
        },
        (homeData) {
          emit(SuccessHomeState(data: homeData));
        },
      );
    } catch (e) {
      emit(ErrorHomeState(msg: ErrorHandler.defaultMessage()));
    }
  }
}
