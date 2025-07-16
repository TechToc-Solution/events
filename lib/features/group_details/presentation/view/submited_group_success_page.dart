import 'package:events/core/utils/constats.dart';
import 'package:events/core/utils/styles.dart';
import 'package:events/features/group_details/data/model/group_detail_model.dart';
import 'package:events/features/group_details/presentation/view/custom_button.dart';
import 'package:events/features/group_details/presentation/view/widget/success_card.dart';
import 'package:events/features/home/presentation/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:events/core/utils/app_localizations.dart';
import 'package:events/core/utils/colors.dart';

class SubmitedGroupSuccessPage extends StatelessWidget {
  final List<GroupDetailModel> groupDetails;
  final String groupName;

  const SubmitedGroupSuccessPage({
    super.key,
    required this.groupDetails,
    required this.groupName,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: kVerticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SuccessCard(groupName: groupName, groupDetails: groupDetails),
              const SizedBox(height: 16),
              CustomButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                },
                child: Text(
                  "backe_to_category".tr(context),
                  style: Styles.textStyle16.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
