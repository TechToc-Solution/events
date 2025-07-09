import 'package:events/core/utils/styles.dart';
import 'package:events/features/group_details/presentation/view_model/player_selection_cubit/player_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:events/core/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionIndicator extends StatelessWidget {
  const SelectionIndicator({super.key, required this.numOfSelection});
  final int numOfSelection;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerSelectionCubit, PlayerSelectionState>(
      builder: (context, state) {
        final selectedPlayers = context.read<PlayerSelectionCubit>().selectedPlayers;
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 251, 232),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderColors, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Localizations.localeOf(context).languageCode == "ar"
                    ? "يرجى اختيار $numOfSelection مرشحين حسب الترتيب من 1 الى $numOfSelection"
                    : "Please select $numOfSelection candidates in order from 1 to $numOfSelection",
                style: Styles.textStyle16.copyWith(color: AppColors.primaryColors, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                Localizations.localeOf(context).languageCode == "ar"
                    ? "تم اختيار ${selectedPlayers.length} من اصل $numOfSelection"
                    : "Selected ${selectedPlayers.length} out of $numOfSelection",
                style: Styles.textStyle15.copyWith(color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(numOfSelection, (index) {
                  final isFilled = index < selectedPlayers.length;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: isFilled ? Colors.green : Colors.grey[300],
                      child: Text(
                        (index + 1).toString(),
                        style: Styles.textStyle15.copyWith(color: isFilled ? Colors.white : Colors.black),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
