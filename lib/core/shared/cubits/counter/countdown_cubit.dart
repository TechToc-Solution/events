import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class CountdownState extends Equatable {
  final Duration remaining;

  const CountdownState(this.remaining);

  @override
  List<Object?> get props => [remaining];
}

class CountdownCubit extends Cubit<CountdownState> {
  Timer? _timer;

  CountdownCubit() : super(const CountdownState(Duration.zero));

  void start(Duration duration) {
    _timer?.cancel();
    emit(CountdownState(duration));
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final newDuration = state.remaining - Duration(seconds: 1);
      if (newDuration <= Duration.zero) {
        _timer?.cancel();
        emit(const CountdownState(Duration.zero));
      } else {
        emit(CountdownState(newDuration));
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
