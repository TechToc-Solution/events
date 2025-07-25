import 'package:events/core/utils/app_localizations.dart';
import 'package:flutter/material.dart';

import '../utils/constats.dart';
import '../utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline_rounded, size: 50, color: Colors.red),
          const SizedBox(height: kSizedBoxHeight),
          Text(
            errorMessage,
            style: Styles.textStyle18.copyWith(
              color: textColor ?? Colors.black,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: kSizedBoxHeight),
          ElevatedButton.icon(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: colorScheme.errorContainer,
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
                vertical: kVerticalPadding,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: const Icon(Icons.refresh_rounded),
            label: Text(
              "try_again".tr(context),
              style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
