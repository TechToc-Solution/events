import 'package:events/core/utils/app_localizations.dart';
import 'package:events/core/utils/colors.dart';
import 'package:events/core/utils/styles.dart';
import 'package:events/features/group_details/data/model/group_detail_model.dart';
import 'package:events/features/group_details/presentation/view/widget/player_item.dart';
import 'package:flutter/material.dart';

class SuccessCard extends StatelessWidget {
  final String groupName;
  final List<GroupDetailModel> groupDetails;

  const SuccessCard({
    super.key,
    required this.groupName,
    required this.groupDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 2, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.green,
            child: Icon(Icons.check, color: Colors.white, size: 50),
          ),
          const SizedBox(height: 16),
          Text(
            "thank_you".tr(context),
            style: Styles.textStyle30.copyWith(color: Colors.green),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Styles.textStyle16.copyWith(color: Colors.black),
              children: [
                TextSpan(
                  text: "your_group_has_been_submitted_successfully".tr(
                    context,
                  ),
                ),
                TextSpan(
                  text: " $groupName",
                  style: Styles.textStyle16.copyWith(
                    color: AppColors.primaryColors,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 32),
          Text(
            "your_choices".tr(context),
            style: Styles.textStyle18.copyWith(color: AppColors.primaryColors),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: groupDetails.length,
            itemBuilder: (context, index) {
              return PlayerItem(player: groupDetails[index], index: index + 1);
            },
            separatorBuilder: (_, __) => const SizedBox(height: 8),
          ),
        ],
      ),
    );
  }
}
