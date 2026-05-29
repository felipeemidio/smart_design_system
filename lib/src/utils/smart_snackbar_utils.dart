import 'package:flutter/material.dart';

abstract class SmartSnackBarUtils {
  static const _kDuration = Duration(seconds: 4);

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> success(
    BuildContext context, {
    required String message,
  }) {
    return _showSnackBar(
      context,
      message: message,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      textStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> error(
    BuildContext context, {
    required String message,
  }) {
    return _showSnackBar(
      context,
      message: message,
      backgroundColor: Theme.of(context).colorScheme.errorContainer,
      textStyle: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> info(
    BuildContext context, {
    required String message,
  }) {
    return _showSnackBar(
      context,
      message: message,
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      textStyle: TextStyle(color: Theme.of(context).colorScheme.onTertiaryContainer),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _showSnackBar(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required TextStyle? textStyle,
  }) {
    final isPhoneScreen = MediaQuery.of(context).size.width <= 500;
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: isPhoneScreen
            ? null
            : EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height - 60,
                left: MediaQuery.of(context).size.width - 400,
                right: 10,
              ),
        dismissDirection: isPhoneScreen ? null : DismissDirection.up,
        behavior: isPhoneScreen ? SnackBarBehavior.fixed : SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        closeIconColor: textStyle?.color,
        showCloseIcon: true,
        content: Text(message, style: textStyle),
        duration: _kDuration,
      ),
    );
  }
}
