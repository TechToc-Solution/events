import 'package:flutter/material.dart';
import '../../../../../core/utils/constats.dart';

class CustomHomeShimmer extends StatelessWidget {
  const CustomHomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: kSizedBoxHeight),
          // const TopThreeShimmer(),
          // const SizedBox(height: kSizedBoxHeight),
          // const CategorySectionShimmer(),
          // const SizedBox(height: kSizedBoxHeight),
          // const AdsSectionShimmer(),
        ],
      ),
    );
  }
}
