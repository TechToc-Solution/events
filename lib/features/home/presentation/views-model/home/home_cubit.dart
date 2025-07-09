import 'package:events/core/errors/error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:events/core/shared/cubits/counter/countdown_cubit.dart';

import 'package:events/features/home/data/model/home_model.dart';
import 'package:events/features/home/data/repo/home/home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo, this.countdownCubit) : super(HomeInitial());
  final HomeRepo _homeRepo;
  final CountdownCubit countdownCubit;

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
          final now = DateTime.now();
          final target = homeData.time;
          print("⏰ Now: $now");
          print("🕒 Target from API: $target");
          if (target != null && target.isAfter(now)) {
            final remaining = target.difference(now);
            print("✅ Starting countdown: $remaining");
            countdownCubit.start(remaining);
          }
        },
      );
    } catch (e) {
      emit(ErrorHomeState(msg: ErrorHandler.defaultMessage()));
    }
  }
}
