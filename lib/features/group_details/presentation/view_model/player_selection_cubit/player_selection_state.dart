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

final class PlayerSelectionLoading extends PlayerSelectionState {}

final class PlayerSelectionSuccess extends PlayerSelectionState {}

final class PlayerSelectionError extends PlayerSelectionState {
  final String message;

  const PlayerSelectionError({required this.message});

  @override
  List<Object> get props => [message];
}
