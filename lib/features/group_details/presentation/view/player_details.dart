import 'package:events/core/locale/locale_cubit.dart';
import 'package:events/core/utils/app_localizations.dart';
import 'package:events/core/utils/colors.dart';
import 'package:events/core/utils/constats.dart';
import 'package:events/core/utils/functions.dart';
import 'package:events/features/group_details/data/model/group_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerDetailsScreen extends StatelessWidget {
  static const String routeName = '/player_details';
  const PlayerDetailsScreen({super.key, required this.player});
  final GroupDetailModel player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColors,
        title: Row(
          children: [
            const Icon(Icons.phone, color: Colors.white),
            const SizedBox(width: 4),
            Text(
              "contact_us".tr(context),
              style: const TextStyle(fontFamily: "cocon-next-arabic"),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () async {
              final currentLocale = Localizations.localeOf(
                context,
              ).languageCode;
              final cubit = context.read<LocaleCubit>();
              if (currentLocale == 'en') {
                cubit.changeLanguage('ar');
              } else {
                cubit.changeLanguage('en');
              }
              resetHomeCubits(context);
            },
            child: Text(
              Localizations.localeOf(context).languageCode == "ar"
                  ? "English"
                  : "Arabic",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
            vertical: kVerticalPadding,
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Card(
                elevation: 4,
                margin: const EdgeInsets.all(8),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secColors,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
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
                                          (player.id.toString().length / 2);
                                      return Text(
                                        player.id.toString(),
                                        style: TextStyle(
                                          fontSize: fontSize.clamp(18, 26),
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  final fontSize =
                                      constraints.maxWidth /
                                      ((player.name?.length ?? 2) / 2);
                                  return Text(
                                    player.name ?? "",
                                    style: TextStyle(
                                      fontSize: fontSize.clamp(16, 20),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  final fontSize =
                                      constraints.maxWidth /
                                      (player.sport.toString().length / 2);
                                  return Text(
                                    player.sport.toString(),
                                    style: TextStyle(
                                      fontSize: fontSize.clamp(10, 14),
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 4),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  final fontSize =
                                      constraints.maxWidth /
                                      (player.country.toString().length / 2);
                                  return Text(
                                    player.country.toString(),
                                    style: TextStyle(
                                      fontSize: fontSize.clamp(8, 12),
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 16,
                                  child: VerticalDivider(
                                    thickness: 4,
                                    width: 0,
                                    color: AppColors.secondaryColors,
                                  ),
                                ),
                                SizedBox(width: 8),
                                LayoutBuilder(
                                  builder: (context, constraints) {
                                    final fontSize =
                                        constraints.maxWidth /
                                        ("aboutTitle".tr(context).length / 2);
                                    return Text(
                                      "aboutTitle".tr(context),
                                      style: TextStyle(
                                        fontSize: fontSize.clamp(10, 14),
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColors,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            Text("-"),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                SizedBox(
                                  height: 16,
                                  child: VerticalDivider(
                                    thickness: 4,
                                    width: 0,
                                    color: AppColors.secondaryColors,
                                  ),
                                ),
                                SizedBox(width: 8),
                                LayoutBuilder(
                                  builder: (context, constraints) {
                                    final fontSize =
                                        constraints.maxWidth /
                                        ("achievementsTitle"
                                                .tr(context)
                                                .length /
                                            2);
                                    return Text(
                                      "achievementsTitle".tr(context),
                                      style: TextStyle(
                                        fontSize: fontSize.clamp(10, 14),
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColors,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            Text(player.achievement ?? ""),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
