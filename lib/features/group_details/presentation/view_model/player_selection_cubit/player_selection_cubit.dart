import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:events/features/group_details/data/repo/player_selection_repo.dart';
import 'package:events/features/group_details/presentation/params/player_selection_params.dart';

part 'player_selection_state.dart';

class PlayerSelectionCubit extends Cubit<PlayerSelectionState> {
  final PlayerSelectionRepo playerSelectionRepo;
  PlayerSelectionCubit({required this.playerSelectionRepo}) : super(PlayerSelectionInitial());
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

  void playerSelection(PlayerSelectionParams params) async {
    emit(PlayerSelectionLoading());
    final result = await playerSelectionRepo.playerSelection(params);
    result.fold(
      (failure) => emit(PlayerSelectionError(message: failure.message)),
      (groups) => emit(PlayerSelectionSuccess()),
    );
  }
}
