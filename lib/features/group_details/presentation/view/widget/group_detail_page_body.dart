import 'package:events/core/utils/functions.dart';
import 'package:events/core/utils/styles.dart';
import 'package:events/features/group_details/data/model/group_detail_model.dart';
import 'package:events/features/group_details/presentation/view/custom_button.dart';
import 'package:events/features/group_details/presentation/view/group_detail_page.dart';
import 'package:events/features/group_details/presentation/view/submited_group_success_page.dart';
import 'package:events/features/group_details/presentation/view/widget/player_card.dart';
import 'package:events/features/group_details/presentation/view/widget/selection_indicator.dart';
import 'package:events/features/group_details/presentation/view_model/player_selection_cubit/player_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:events/core/utils/app_localizations.dart';
import 'package:events/core/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../params/player_selection_params.dart';

class GroupDetailsPageBoyd extends StatelessWidget {
  const GroupDetailsPageBoyd({
    super.key,
    required this.groupDetails,
    required this.groupName,
    required this.numOfSelection,
  });

  final int numOfSelection;
  final List<GroupDetailModel> groupDetails;
  final String groupName;

  @override
  Widget build(BuildContext context) {
    final TextEditingController notesController = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [AppColors.primaryColors, AppColors.secondaryColors]),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "best_sport_personality".tr(context),
              style: Styles.textStyle20.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.primaryColors, width: 2),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "view_selection_criteria".tr(context),
                  style: Styles.textStyle20.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primaryColors,
                  child: const Icon(Icons.check_circle_outline_rounded, size: 18, color: Colors.white),
                ),
              ],
            ),
          ),

          SelectionIndicator(numOfSelection: numOfSelection),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: groupDetails.length,
            itemBuilder: (context, index) {
              final player = groupDetails[index];
              return PlayerCard(player: player);
            },
          ),

          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.borderColors, width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "add_notes".tr(context),
                  style: Styles.textStyle16.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
                  child: TextField(
                    controller: notesController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[200]!)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[200]!)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[200]!)),
                      fillColor: Colors.white,
                      hintText: "add_notes_hint".tr(context),
                      hintStyle: Styles.textStyle13.copyWith(color: Colors.black45),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          BlocConsumer<PlayerSelectionCubit, PlayerSelectionState>(
            listener: (context, state) {
              if (state is PlayerSelectionSuccess) {
                messages(context, "selection_success".tr(context), Colors.green);
              }
              if (state is PlayerSelectionError) {
                messages(context, state.message, Colors.red);
              }
            },
            builder: (context, state) {
              final selectdPlayers = context.read<PlayerSelectionCubit>().selectedPlayers;
              final slectedGdetail = groupDetails.where((element) => selectdPlayers.contains(element.id)).toList();
              return CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SubmitedGroupSuccessPage(groupDetails: slectedGdetail, groupName: groupName),
                    ),
                  );
                  // if (selectdPlayers.isNotEmpty) {
                  //   context.read<PlayerSelectionCubit>().playerSelection(
                  //     PlayerSelectionParams(
                  //       groupId: widget.groupId,
                  //       playerId: selectdPlayers,
                  //       notes: notesController.text,
                  //     ),
                  //   );
                  // } else {
                  //   messages(context, "select_at_least_players".tr(context), Colors.red);
                  // }
                },
                child: state is PlayerSelectionLoading
                    ? SizedBox(height: 20, width: 20, child: const CircularProgressIndicator())
                    : Text("accept_selection".tr(context), style: Styles.textStyle16.copyWith(color: Colors.white)),
              );
            },
          ),
        ],
      ),
    );
  }
}
