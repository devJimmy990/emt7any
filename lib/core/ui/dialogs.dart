import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AppDialog {
  static Future<void> show({
    required BuildContext context,
    required DialogType type,
    String? title,
    String? desc,
    Widget? body,
    VoidCallback? onOk,
    VoidCallback? onCancel,
  }) async => AwesomeDialog(
    desc: desc,
    body: body,
    width: 500,
    title: title,
    context: context,
    dialogType: type,
    btnOkOnPress: onOk,
    btnCancelOnPress: onCancel,
    dismissOnTouchOutside: false,
  ).show();

  /// 🔹 Success dialog
  static Future<void> success({
    required BuildContext context,
    String? title,
    String? desc,
    Widget? body,
    VoidCallback? onOk,
  }) => show(
    context: context,
    type: DialogType.success,
    title: title,
    desc: desc,
    onOk: onOk,
    body: body,
  );

  /// 🔹 Error dialog
  static Future<void> error({
    required BuildContext context,
    String? title,
    String? desc,
    Widget? body,
    VoidCallback? onOk,
  }) => show(
    context: context,
    type: DialogType.error,
    title: title,
    desc: desc,
    onOk: onOk,
    body: body,
  );

  /// 🔹 Warning dialog
  static Future<void> warning({
    required BuildContext context,
    String? title,
    String? desc,
    Widget? body,
    VoidCallback? onOk,
    VoidCallback? onCancel,
  }) => show(
    context: context,
    type: DialogType.warning,
    title: title,
    desc: desc,
    body: body,
    onOk: onOk,
    onCancel: onCancel,
  );

  /// 🔹 Info dialog
  static Future<void> info({
    required BuildContext context,
    String? title,
    String? desc,
    Widget? body,
    VoidCallback? onOk,
  }) => show(
    context: context,
    type: DialogType.info,
    title: title,
    desc: desc,
    onOk: onOk,
    body: body,
  );
}
