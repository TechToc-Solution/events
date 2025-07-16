import 'package:cached_network_image/cached_network_image.dart';
import 'package:events/core/Api_services/urls.dart';
import 'package:events/core/utils/colors.dart';
import 'package:events/core/utils/styles.dart';
import 'package:events/features/group_details/data/model/group_detail_model.dart';
import 'package:flutter/material.dart';

class PlayerItem extends StatelessWidget {
  final GroupDetailModel player;
  final int index;

  const PlayerItem({super.key, required this.player, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 251, 232),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primaryColors, width: 2),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.primaryColors,
            child: Text(
              "$index",
              style: Styles.textStyle18.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryColors, width: 2),
            ),
            child: ClipOval(
              child: (player.img == null || player.img!.isEmpty)
                  ? const Icon(Icons.person, size: 36, color: Colors.grey)
                  : CachedNetworkImage(
                      imageUrl: "${Urls.imgPath}${player.img}",
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColors,
                              value: progress.progress,
                            ),
                          ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.person,
                        size: 36,
                        color: Colors.grey,
                      ),
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  player.name ?? "",
                  style: Styles.textStyle16.copyWith(
                    color: AppColors.primaryColors,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (player.sport != null)
                  Text(
                    player.sport!,
                    style: Styles.textStyle18.copyWith(color: Colors.black),
                  ),
                if (player.country != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(player.country!, style: Styles.textStyle13),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
