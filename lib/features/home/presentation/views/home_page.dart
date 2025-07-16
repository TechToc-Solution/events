import 'package:events/core/locale/locale_cubit.dart';
import 'package:events/core/shared/cubits/token/token_cubit.dart';
import 'package:events/core/utils/app_localizations.dart';
import 'package:events/core/utils/colors.dart';
import 'package:events/core/utils/constats.dart';
import 'package:events/core/utils/functions.dart';
import 'package:events/features/home/presentation/views-model/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_error_widget.dart';

import 'widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/home';

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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColors,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
              ),
              onPressed: () async {
                final cubit = context.read<LocaleCubit>();
                final currentLocale = cubit.currentLocale.languageCode;
                final newLang = currentLocale == 'en' ? 'ar' : 'en';

                await cubit.changeLanguage(newLang);
                await context.read<TokenCubit>().getToken(context);
                resetHomeCubits(context);
              },
              icon: const Icon(Icons.language, size: 18),
              label: Text(
                Localizations.localeOf(context).languageCode == "ar"
                    ? "English"
                    : "العربية",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),

      body: BlocBuilder<TokenCubit, TokenState>(
        builder: (context, tokenState) {
          if (tokenState is SuccessTokenState) {
            context.read<HomeCubit>().getHome();
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, homeState) {
                  if (homeState is ErrorHomeState) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomErrorWidget(
                        errorMessage: homeState.msg,
                        onRetry: () => context.read<HomeCubit>().getHome(),
                      ),
                    );
                  } else if (homeState is SuccessHomeState) {
                    return Expanded(child: HomePageBody(data: homeState.data));
                  }
                  return Expanded(
                    child: Center(child: const CircularProgressIndicator()),
                  );
                },
              ),
            );
          } else if (tokenState is ErrorTokenState) {
            return Center(
              child: CustomErrorWidget(
                errorMessage: tokenState.msg,
                onRetry: () => context.read<TokenCubit>().getToken(context),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
