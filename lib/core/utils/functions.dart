import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:events/core/shared/cubits/token/token_cubit.dart';
import 'package:events/core/utils/app_localizations.dart';
import 'package:flutter/material.dart' hide Key;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/cutom_dialog.dart';

//navigators
Route goRoute({required var x}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => x,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.fastEaseInToSlowEaseOut;

      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);
      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

//messages
void messages(BuildContext context, String error, Color c, {int msgTime = 2}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: c,
      content: Text(error),
      duration: Duration(seconds: msgTime),
    ),
  );
}

void showCustomDialog({
  required BuildContext context,
  required String title,
  required String description,
  required String primaryButtonText,
  String? secondaryButtonText,
  Color? primaryButtonColor,
  Color? secondaryButtonColor,
  IconData? icon,
  bool? oneButton,
  required void Function() onPrimaryAction,
  void Function()? onSecondaryAction,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CustomDialog(
        title: title,
        oneButton: oneButton,
        description: description,
        primaryButtonText: primaryButtonText,
        secondaryButtonText: secondaryButtonText ?? "cancel".tr(context),
        primaryButtonColor: primaryButtonColor,
        secondaryButtonColor: secondaryButtonColor,
        icon: icon ?? Icons.lock,
        onPrimaryAction: onPrimaryAction,
        onSecondaryAction: onSecondaryAction ?? () => Navigator.pop(context),
      );
    },
  );
}

void showAwesomeDialog({
  required BuildContext context,
  required DialogType dialogType,
  required String title,
  required String desc,
  required void Function() btnOk,
  required void Function() btnCancel,
}) async {
  await AwesomeDialog(
    descTextStyle: TextStyle(fontSize: 16),
    btnOkText: "yes".tr(context),
    btnCancelText: "no".tr(context),
    context: context,
    dialogType: dialogType,
    animType: AnimType.scale,
    title: title,
    desc: desc,
    btnCancelOnPress: btnCancel,
    btnOkOnPress: btnOk,
  ).show();
}

//reset home
resetHomeCubits(BuildContext context) {
  context.read<TokenCubit>().getToken(context);
}

Future<bool> isRunningOnEmulator() async {
  final deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    final androidInfo = await deviceInfo.androidInfo;
    return !androidInfo.isPhysicalDevice ||
        androidInfo.model.toLowerCase().contains('sdk') ||
        androidInfo.manufacturer.toLowerCase().contains('genymotion');
  } else if (Platform.isIOS) {
    final iosInfo = await deviceInfo.iosInfo;
    return !iosInfo.isPhysicalDevice;
  }

  return false;
}

Future<void> blockIfDebugOrEmulator() async {
  final emulator = await isRunningOnEmulator();
  var inDebugMode = false;

  assert(() {
    inDebugMode = true;
    return true;
  }());

  if (inDebugMode || emulator) {
    exit(0);
  }
}
