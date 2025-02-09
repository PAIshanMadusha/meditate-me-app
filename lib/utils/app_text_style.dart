import 'package:flutter/material.dart';
import 'package:meditate_me_app/utils/app_colors.dart';

class AppTextStyle {
   static const TextStyle kMainTitleStyle = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w900,
    color: AppColors.kMainTitleColor,
   );

   static const TextStyle kTitleStyle = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
    color: AppColors.kBlackColor,
   );

   static const TextStyle kBodyStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.kBrownColor,
   );

   static const TextStyle kSmallDescriptionStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: AppColors.kGreyColor,
   );
}