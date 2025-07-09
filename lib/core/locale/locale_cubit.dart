import 'package:events/core/utils/cache_helper.dart';
import 'package:events/core/utils/constats.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState(locale: const Locale("en")));

  Future<void> getSaveLanguage() async {
    final String cachedLanguageCode = CacheHelper.getData(
      key: "LOCALE",
    ).toString();

    lang = cachedLanguageCode;
    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await CacheHelper.setString(key: "LOCALE", value: languageCode);
    lang = languageCode;
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
