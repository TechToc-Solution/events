import 'package:events/core/utils/app_localizations.dart';
import 'package:events/core/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
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

      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColors,
              const Color.fromARGB(255, 189, 82, 0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final fontSize =
                    constraints.maxWidth /
                    ("home_title_1".tr(context).length / 2);
                return Text(
                  textAlign: TextAlign.center,
                  "home_title_1".tr(context),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize.clamp(18, 22),
                  ),
                );
              },
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                final fontSize =
                    constraints.maxWidth /
                    ("home_title_2".tr(context).length / 2);
                return Text(
                  textAlign: TextAlign.center,
                  "home_title_2".tr(context),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize.clamp(14, 18),
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
