import 'package:flutter/material.dart';

class AppColors {
  static const Color kBlackColor = Colors.black;
  static const Color kWhiteColor = Colors.white;
  static const Color kGreyColor = Colors.grey;
  static const Color kBlueColor = Colors.blue;
  static const Color kMainTitleColor = Color(0xff1D1616);

  static const Color kFChipContainerColor1 = Color(0xffDAD2FF);
  static const Color kFChipContainerColor2 = Color(0xffB2A5FF);
  static const Gradient kFChipContainerColor = LinearGradient(
    colors: [
      kFChipContainerColor1,
      kFChipContainerColor2,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
