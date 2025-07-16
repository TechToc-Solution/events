import 'package:cached_network_image/cached_network_image.dart';
import 'package:events/core/Api_services/urls.dart';
import 'package:events/core/utils/styles.dart';
import 'package:events/features/group_details/data/model/group_detail_model.dart';
import 'package:events/features/group_details/presentation/view/player_details.dart';
import 'package:events/features/group_details/presentation/view_model/player_selection_cubit/player_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:events/core/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          padding: const EdgeInsets.all(10),
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Top actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
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
                          : const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            ),
                      onPressed: () => context
                          .read<PlayerSelectionCubit>()
                          .togglePlayerSelection(player.id!),
                    ),
                  ),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.primaryColors,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
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
                ],
              ),

              const SizedBox(height: 8),

              // Avatar
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primaryColors, width: 2),
                ),
                child: ClipOval(
                  child: (player.img == null || player.img!.isEmpty)
                      ? const Icon(Icons.person, size: 40, color: Colors.grey)
                      : CachedNetworkImage(
                          imageUrl: "${Urls.imgPath}${player.img}",
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColors,
                                  value: downloadProgress.progress,
                                ),
                              ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.grey,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 8),

              // Player Name
              Flexible(
                child: Text(
                  player.name ?? "",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 4),

              // Sport
              if (player.sport != null)
                Text(
                  player.sport!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13, color: Colors.blue),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),

              // Country
              if (player.country != null)
                Text(
                  player.country!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13, color: Colors.blue),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
            ],
          ),
        );
      },
    );
  }
}
