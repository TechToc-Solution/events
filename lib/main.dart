import 'package:events/core/locale/locale_cubit.dart';
import 'package:events/core/shared/cubits/counter/countdown_cubit.dart';
import 'package:events/core/shared/cubits/token/token_cubit.dart';
import 'package:events/core/shared/repos/token_repo/token_repo.dart';
import 'package:events/core/utils/app_localizations.dart';
import 'package:events/features/home/data/repo/home/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:events/core/utils/cache_helper.dart';
import 'package:events/core/utils/colors.dart';
import 'package:events/core/utils/routs.dart';
import 'package:events/core/utils/services_locater.dart';
import 'package:events/core/utils/styles.dart';

import 'package:events/features/home/presentation/views-model/home/home_cubit.dart';
import 'package:events/features/home/presentation/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setupLocatorServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocaleCubit()),
        BlocProvider(
          create: (context) =>
              TokenCubit(getit.get<TokenRepo>())..getToken(context),
        ),
        BlocProvider(
          create: (_) => CountdownCubit(
            Duration(days: 29, hours: 23, minutes: 47, seconds: 41),
          ),
        ),
        BlocProvider(create: (context) => HomeCubit(getit.get<HomeRepo>())),
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            supportedLocales: const [Locale("en"), Locale("ar")],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (deviceLocal, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocal != null &&
                    deviceLocal.languageCode == locale.languageCode) {
                  return deviceLocal;
                }
              }
              return supportedLocales.first;
            },
            title: 'Events',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: AppColors.backgroundColor,
                scrolledUnderElevation: 0,
                centerTitle: true,
                elevation: 0,
                titleTextStyle: Styles.textStyle18.copyWith(
                  color: AppColors.backgroundColor,
                ),
              ),
              fontFamily: "cocon-next-arabic",
              scaffoldBackgroundColor: AppColors.backgroundColor,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primaryColors,
              ),
              useMaterial3: true,
            ),
            initialRoute: HomePage.routeName,
            routes: Routes.routes,
          );
        },
      ),
    );
  }
}
