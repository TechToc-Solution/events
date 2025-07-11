import 'package:events/core/shared/cubits/counter/countdown_cubit.dart';
import 'package:events/core/utils/app_localizations.dart';
import 'package:events/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountdownTimerWidget extends StatelessWidget {
  const CountdownTimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountdownCubit, CountdownState>(
      builder: (context, state) {
        final days = state.remaining.inDays;
        final hours = state.remaining.inHours % 24;
        final minutes = state.remaining.inMinutes % 60;
        final seconds = state.remaining.inSeconds % 60;

        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColors, width: 2),
            color: AppColors.secColors,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 4),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final fontSize =
                      constraints.maxWidth /
                      ("time_left".tr(context).length / 2);
                  return Text(
                    "time_left".tr(context),
                    style: TextStyle(
                      fontSize: fontSize.clamp(16, 20),
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColors,
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTimeBox(value: days, label: 'days'.tr(context)),
                  buildTimeBox(value: hours, label: 'hours'.tr(context)),
                  buildTimeBox(value: minutes, label: 'minutes'.tr(context)),
                  buildTimeBox(value: seconds, label: 'seconds'.tr(context)),
                ],
              ),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (context, constraints) {
                  final fontSize =
                      constraints.maxWidth /
                      ("time_left_hint".tr(context).length / 2);
                  return Text(
                    textAlign: TextAlign.center,
                    "time_left_hint".tr(context),
                    style: TextStyle(
                      fontSize: fontSize.clamp(12, 16),
                      color: AppColors.primaryColors,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildTimeBox({required int value, required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final fontSize = constraints.maxWidth;
                return Text(
                  value.toString().padLeft(2, '0'),
                  style: TextStyle(
                    fontSize: fontSize.clamp(24, 32),
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColors,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 6),
          LayoutBuilder(
            builder: (context, constraints) {
              final fontSize = constraints.maxWidth / (label.length / 2);
              return Text(
                label,
                style: TextStyle(
                  fontSize: fontSize.clamp(10, 14),
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
