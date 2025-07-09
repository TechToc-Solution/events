import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:events/features/home/data/model/home_model.dart';
import 'package:events/features/home/data/repo/ads/home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepo _homeRepo;

  Future<void> getHome() async {
    emit(LoadingHomeState());
  }
}
