import 'package:events/core/utils/cache_helper.dart';
import 'package:flutter/material.dart';


String lang = "ar";
const double kBorderRadius = 16;
const double kSizedBoxHeight = 25;
const double kVerticalPadding = 16;
const double kHorizontalPadding = 12;

int sdkInt = 30;

int oldDevicesVer = 21;
const String verCode = "1.0.0";
bool isGuest = CacheHelper.getData(key: "token") == null ? true : false;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
