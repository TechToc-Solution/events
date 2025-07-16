import 'package:events/core/utils/app_localizations.dart';
import 'package:events/core/utils/colors.dart';
import 'package:events/core/utils/constats.dart';
import 'package:events/features/group_details/data/model/criteria_model.dart';
import 'package:flutter/material.dart';

class ConditionsScreen extends StatelessWidget {
  const ConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
            vertical: kVerticalPadding,
          ),
          child: ListView.builder(
            itemCount: lang == "ar"
                ? dummyCriteriaListArabic.length
                : dummyCriteriaListEnglish.length,
            itemBuilder: (context, index) => CriteriaCard(
              criteria: lang == "ar"
                  ? dummyCriteriaListArabic[index]
                  : dummyCriteriaListEnglish[index],
            ),
          ),
        ),
      ),
    );
  }
}

class CriteriaCard extends StatelessWidget {
  final CriteriaModel criteria;

  const CriteriaCard({super.key, required this.criteria});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              criteria.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.primaryColors,
              ),
            ),
            const SizedBox(height: 10),
            ...criteria.points.map(
              (point) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("•  "),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(fontSize: 15, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
