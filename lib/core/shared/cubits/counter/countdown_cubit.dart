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
  final Duration initialDuration;
  Timer? _timer;

  CountdownCubit(this.initialDuration) : super(CountdownState(initialDuration)) {
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      final secondsLeft = state.remaining.inSeconds;
      if (secondsLeft <= 0) {
        _timer?.cancel();
      } else {
        emit(CountdownState(Duration(seconds: secondsLeft - 1)));
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
