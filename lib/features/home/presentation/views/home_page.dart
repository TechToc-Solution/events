import 'dart:ffi';

import 'package:events/core/locale/locale_cubit.dart';
import 'package:events/core/shared/cubits/token/token_cubit.dart';
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
    return BlocBuilder<TokenCubit, TokenState>(
      builder: (context, tokenState) {
        if (tokenState is SuccessTokenState) {
          context.read<HomeCubit>().getHome();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColors,
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    final currentLocale = Localizations.localeOf(
                      context,
                    ).toString();
                    final cubit = context.read<LocaleCubit>();
                    if (currentLocale == 'en') {
                      cubit.changeLanguage('ar');
                    } else {
                      cubit.changeLanguage('en');
                    }
                    resetHomeCubits(context);
                  },
                  child: Text(
                    Localizations.localeOf(context).toString() == "ar"
                        ? "English"
                        : "Arabic",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                SizedBox(width: 4),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizontalPadding,
                  vertical: kVerticalPadding,
                ),
                child: Column(
                  children: [
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, homeState) {
                        if (homeState is ErrorHomeState) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: CustomErrorWidget(
                              errorMessage: homeState.msg,
                              onRetry: () =>
                                  context.read<HomeCubit>().getHome(),
                            ),
                          );
                        } else if (homeState is SuccessHomeState) {
                          return Expanded(
                            child: HomePageBody(data: homeState.data),
                          );
                        }
                        return Expanded(
                          child: Center(
                            child: const CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
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
    );
  }
}
