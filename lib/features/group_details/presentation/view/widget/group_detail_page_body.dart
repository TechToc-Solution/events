import 'package:events/core/utils/functions.dart';
import 'package:events/core/utils/styles.dart';
import 'package:events/features/group_details/data/model/group_detail_model.dart';
import 'package:events/features/group_details/presentation/params/player_selection_params.dart';
import 'package:events/features/group_details/presentation/view/conditions.dart';
import 'package:events/features/group_details/presentation/view/custom_button.dart';
import 'package:events/features/group_details/presentation/view/submited_group_success_page.dart';
import 'package:events/features/group_details/presentation/view/widget/player_card.dart';
import 'package:events/features/group_details/presentation/view/widget/selection_indicator.dart';
import 'package:events/features/group_details/presentation/view_model/player_selection_cubit/player_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:events/core/utils/app_localizations.dart';
import 'package:events/core/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupDetailsPageBody extends StatelessWidget {
  const GroupDetailsPageBody({
    super.key,
    required this.groupDetails,
    required this.groupName,
    required this.numOfSelection,
    required this.groupId,
  });

  final int numOfSelection;
  final List<GroupDetailModel> groupDetails;
  final String groupName;
  final int groupId;

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
              gradient: LinearGradient(
                colors: [AppColors.primaryColors, AppColors.secondaryColors],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final fontSize =
                    constraints.maxWidth /
                    ("best_sport_personality".tr(context).length / 2);
                return Text(
                  "best_sport_personality".tr(context),
                  style: TextStyle(
                    fontSize: fontSize.clamp(16, 20),
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConditionsScreen()),
              );
            },
            child: Container(
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
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final fontSize =
                          constraints.maxWidth /
                          ("view_selection_criteria".tr(context).length / 2);
                      return Text(
                        "view_selection_criteria".tr(context),
                        style: TextStyle(fontSize: fontSize.clamp(16, 20)),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.primaryColors,
                    child: const Icon(
                      Icons.check_circle_outline_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SelectionIndicator(numOfSelection: numOfSelection),

          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount;
              double screenWidth = MediaQuery.of(context).size.width;

              if (screenWidth >= 1200) {
                crossAxisCount = 5;
              } else if (screenWidth >= 900) {
                crossAxisCount = 4;
              } else if (screenWidth >= 600) {
                crossAxisCount = 3;
              } else {
                crossAxisCount = 2;
              }
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth > 600 ? 24.0 : 0,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
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
              );
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
                LayoutBuilder(
                  builder: (context, constraints) {
                    final fontSize =
                        constraints.maxWidth /
                        ("add_notes".tr(context).length / 2);
                    return Text(
                      "add_notes".tr(context),
                      style: TextStyle(
                        fontSize: fontSize.clamp(12, 16),
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: notesController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200]!),
                      ),
                      fillColor: Colors.white,
                      hintText: "add_notes_hint".tr(context),
                      hintStyle: Styles.textStyle13.copyWith(
                        color: Colors.black45,
                      ),
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
                final selectdPlayers = context
                    .read<PlayerSelectionCubit>()
                    .selectedPlayers;
                final slectedGdetail = groupDetails
                    .where((element) => selectdPlayers.contains(element.id))
                    .toList();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubmitedGroupSuccessPage(
                      groupDetails: slectedGdetail,
                      groupName: groupName,
                    ),
                  ),
                );
              }
              if (state is PlayerSelectionError) {
                messages(context, state.message, Colors.red);
              }
            },
            builder: (context, state) {
              final selectdPlayers = context
                  .read<PlayerSelectionCubit>()
                  .selectedPlayers;
              return CustomButton(
                onPressed: () {
                  if (selectdPlayers.isNotEmpty) {
                    context.read<PlayerSelectionCubit>().playerSelection(
                      PlayerSelectionParams(
                        groupId: groupId,
                        playerId: selectdPlayers,
                        notes: notesController.text,
                      ),
                    );
                  } else {
                    messages(
                      context,
                      "select_at_least_players".tr(context),
                      Colors.red,
                    );
                  }
                },
                child: state is PlayerSelectionLoading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: const CircularProgressIndicator(),
                      )
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          final fontSize =
                              constraints.maxWidth /
                              ("accept_selection".tr(context).length / 2);
                          return Text(
                            "accept_selection".tr(context),
                            style: TextStyle(
                              fontSize: fontSize.clamp(16, 20),
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
              );
            },
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
