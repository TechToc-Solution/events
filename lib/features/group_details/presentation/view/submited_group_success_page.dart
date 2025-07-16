import 'package:events/core/utils/constats.dart';
import 'package:events/core/utils/styles.dart';
import 'package:events/features/group_details/data/model/group_detail_model.dart';
import 'package:events/features/group_details/presentation/view/custom_button.dart';
import 'package:events/features/group_details/presentation/view/widget/success_card.dart';
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
        elevation: 2,
        title: Row(
          children: [
            const Icon(Icons.phone, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              "contact_us".tr(context),
              style: const TextStyle(
                fontFamily: "cocon-next-arabic",
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
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
                  Navigator.pop(context);
                  Navigator.pop(context);
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
