import 'package:events/core/utils/constats.dart';
import 'package:events/features/home/presentation/views-model/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_error_widget.dart';

import 'widgets/custom_home_shimmer.dart';
import 'widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
            vertical: kVerticalPadding,
          ),
          child: Column(
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  // log("$studentsState, $subjectsState, $adsState");
                  // Error Handling
                  if (state is ErrorHomeState) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomErrorWidget(
                        errorMessage: state.msg,
                        onRetry: () => context.read<HomeCubit>().getHome(),
                      ),
                    );
                  }
                  // Success State
                  else if (state is SuccessHomeState) {
                    return Expanded(child: HomePageBody());
                  }
                  // Loading State with Shimmer
                  return Expanded(child: const CustomHomeShimmer());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
