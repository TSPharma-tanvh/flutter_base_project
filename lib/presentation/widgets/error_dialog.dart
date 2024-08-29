import 'package:core/core.dart';
import 'package:core/locales/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'package:flutter_base_project/app/navigator/app_navigator.dart';
import 'package:flutter_base_project/presentation/widgets/base_widget.dart';
import 'package:flutter_base_project/presentation/widgets/custom_dialog.dart';

Future showErrorDialog({
  required String title,
  String? headerTitle,
  bool showCloseButton = true,
  Function()? onClose,
  Function()? onRetry,
  String? retryText,
  bool shouldDismiss = true,
  Widget? errorImage,
}) async {
  final context = AppNavigator.navigatorKey.currentContext;

  if (context == null) {
    return;
  }

  await showDialog(
      context: context,
      builder: (_) => WillPopScope(
            onWillPop: () async {
              // if (onTapClose != null) {
              //   onTapClose();
              // }
              return shouldDismiss;
            },
            child: ErrorDialog(
              errorText: title,
              errorTitle: headerTitle,
              showIconClose: showCloseButton,
              onTap: onRetry,
              onTapClose: onClose,
              textBtnAccept: retryText,
              errorImage: errorImage ?? const SizedBox.shrink(),
            ),
          ));
}

class ErrorDialog extends BaseWidget {
  final String errorText;
  final bool showIconClose;
  final Function()? onTap;
  final bool logout;
  final Function()? onTapClose;
  final String? textBtnAccept;
  final String? errorTitle;
  final Widget errorImage;

  const ErrorDialog({
    super.key,
    required this.errorText,
    this.showIconClose = true,
    this.onTap,
    this.onTapClose,
    this.logout = false,
    this.textBtnAccept,
    this.errorTitle,
    this.errorImage = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context, AppThemeCore theme, AppLocalizations t) {
    final colors = theme.colors;
    return CustomDialog(
      colorTitle: colors.itemRed,
      title: errorTitle ?? t.error,
      content: errorText,
      textBtnAccept: textBtnAccept ?? t.close,
      errorImage: errorImage,
      onPressBtnCancel: () {},
      onPressBtnAccept: () async {
        if (logout) {
          // AppNavigator.pushRoot(Routes.login);
        } else {
          onTap?.call();
          AppNavigator.pop();
        }
      },
      onTapClose: onTapClose,
    );
  }
}
