part of 'player_selection_cubit.dart';

sealed class PlayerSelectionState extends Equatable {
  const PlayerSelectionState();

  @override
  List<Object> get props => [];
}

final class PlayerSelectionInitial extends PlayerSelectionState {}

class PlayerSelectedState extends PlayerSelectionState {
  final List<int> selectedPlayers;

  const PlayerSelectedState({required this.selectedPlayers});

  @override
  List<Object> get props => [selectedPlayers];
}
