import 'package:events/core/utils/styles.dart';
import 'package:events/features/group_details/data/model/group_detail_model.dart';
import 'package:events/features/group_details/presentation/view/player_details.dart';
import 'package:events/features/group_details/presentation/view_model/player_selection_cubit/player_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:events/core/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Player Card Widget
class PlayerCard extends StatelessWidget {
  const PlayerCard({super.key, required this.player});
  final GroupDetailModel player;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerSelectionCubit, PlayerSelectionState>(
      builder: (context, state) {
        final selectedPlayers = (state is PlayerSelectedState)
            ? state.selectedPlayers
            : [];
        final isSelected = selectedPlayers.contains(player.id);
        final selectionIndex = isSelected
            ? selectedPlayers.indexOf(player.id) + 1
            : 0;
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color.fromARGB(255, 255, 251, 232)
                : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: isSelected
                ? Border.all(color: AppColors.borderColors, width: 2)
                : null,
            boxShadow: isSelected
                ? []
                : [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: isSelected
                      ? Colors.green
                      : AppColors.primaryColors,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: isSelected
                        ? Text(
                            selectionIndex.toString(),
                            style: Styles.textStyle16.copyWith(
                              color: Colors.white,
                            ),
                          )
                        : Icon(Icons.add, color: Colors.white, size: 18),
                    onPressed: () => context
                        .read<PlayerSelectionCubit>()
                        .togglePlayerSelection(player.id!),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.primaryColors,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 18,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PlayerDetailsScreen(player: player),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Center(
                    child: Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryColors,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final fontSize =
                                constraints.maxWidth /
                                (player.sport.toString().length / 2);
                            return Text(
                              player.sport.toString(),
                              style: TextStyle(
                                fontSize: fontSize.clamp(14, 26),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final fontSize =
                          constraints.maxWidth /
                          ((player.name?.length ?? 2) / 2);
                      return Text(
                        textAlign: TextAlign.center,

                        player.name ?? "",
                        style: TextStyle(
                          fontSize: fontSize.clamp(16, 26),
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  if (player.country != null) ...[
                    const SizedBox(height: 8),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final fontSize =
                            constraints.maxWidth /
                            ((player.country?.length ?? 2) / 2);
                        return Text(
                          "${player.country}",
                          style: TextStyle(
                            fontSize: fontSize.clamp(8, 18),
                            color: Colors.blue,
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
