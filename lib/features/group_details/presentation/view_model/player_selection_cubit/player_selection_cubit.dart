import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'player_selection_state.dart';

class PlayerSelectionCubit extends Cubit<PlayerSelectionState> {
  PlayerSelectionCubit() : super(PlayerSelectionInitial());
  List<int> selectedPlayers = [];
  int _numOfSelection = 0;
  void togglePlayerSelection(int playerId) {
    final newSelection = List<int>.from(selectedPlayers);

    if (newSelection.contains(playerId)) {
      newSelection.remove(playerId);
    } else {
      if (newSelection.length < _numOfSelection) {
        newSelection.add(playerId);
      }
    }

    selectedPlayers = newSelection;
    emit(PlayerSelectedState(selectedPlayers: selectedPlayers));
  }

  void setNumOfSelection(int numOfSelection) {
    _numOfSelection = numOfSelection;
  }
}
