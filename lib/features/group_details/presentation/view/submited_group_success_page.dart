import 'package:events/core/locale/locale_cubit.dart';
import 'package:events/core/utils/constats.dart';
import 'package:events/core/utils/functions.dart';
import 'package:events/core/utils/styles.dart';
import 'package:events/features/group_details/data/model/group_detail_model.dart';
import 'package:events/features/group_details/presentation/view/custom_button.dart';
import 'package:events/features/home/presentation/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:events/core/utils/app_localizations.dart';
import 'package:events/core/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitedGroupSuccessPage extends StatelessWidget {
  final List<GroupDetailModel> groupDetails;
  final String groupName;
  const SubmitedGroupSuccessPage({super.key, required this.groupDetails, required this.groupName});

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
            Text("contact_us".tr(context), style: const TextStyle(fontFamily: "cocon-next-arabic")),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () async {
              final currentLocale = Localizations.localeOf(context).languageCode;
              final cubit = context.read<LocaleCubit>();
              if (currentLocale == 'en') {
                cubit.changeLanguage('ar');
              } else {
                cubit.changeLanguage('en');
              }
              resetHomeCubits(context);
            },
            child: Text(
              Localizations.localeOf(context).languageCode == "ar" ? "English" : "Arabic",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding, vertical: kVerticalPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [const BoxShadow(color: Colors.black26, blurRadius: 2, offset: Offset(0, 2))],
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
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
                      // Updated text with colored group name
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: Styles.textStyle16.copyWith(color: Colors.black),
                          children: [
                            TextSpan(text: "your_group_has_been_submitted_successfully".tr(context)),
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
                      Divider(),
                      SizedBox(height: 16),
                      Text(
                        "your_choices".tr(context),
                        style: Styles.textStyle18.copyWith(color: AppColors.primaryColors),
                        textAlign: TextAlign.center,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: groupDetails.length,
                        itemBuilder: (context, index) {
                          final player = groupDetails[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 251, 232),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.primaryColors, width: 2),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: AppColors.primaryColors,
                                  child: Text("${index + 1}", style: Styles.textStyle20.copyWith(color: Colors.white)),
                                ),
                                SizedBox(width: 16),
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.amber,
                                  child: Text(
                                    "${player.sport}",
                                    style: Styles.textStyle20.copyWith(color: Colors.white),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        player.name ?? "",
                                        style: Styles.textStyle16.copyWith(color: AppColors.primaryColors),
                                      ),
                                      if (player.country != null) ...[
                                        const SizedBox(height: 8),
                                        Text(
                                          player.country.toString(),
                                          style: Styles.textStyle13.copyWith(color: Colors.black),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 8);
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                        },
                        child: Text(
                          "backe_to_category".tr(context),
                          style: Styles.textStyle16.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
