import 'package:flutter/material.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';

class AppHelper {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.kWhiteColor,
        content: Text(
          message,
          style: AppTextStyle.kBodyStyle.copyWith(
            color: AppColors.kGreyColor,
            fontSize: 14,
          ),
        ),
        duration: Duration(seconds: 10),
      ),
    );
  }
}
