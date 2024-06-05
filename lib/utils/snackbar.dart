import 'package:flutter/material.dart';
import 'package:flutter_application_diamond_shop_final/theme.dart';

enum AlertType {
  success,
  error,
  warning,
}

void showCustomAlert(BuildContext context, String message,
    [AlertType alertType = AlertType.success]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: alertType == AlertType.success
          ? AppColors.kSuccess600
          : alertType == AlertType.error
              ? AppColors.kAlert500
              : AppColors.kWarning500,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      content: Text(
        message,
        style: TextStyle(
          fontFamily: 'SM',
        ),
      ),
    ),
  );
}
