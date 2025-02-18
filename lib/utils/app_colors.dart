import 'package:flutter/material.dart';

class AppColors {
  static const Color kBlackColor = Colors.black;
  static const Color kWhiteColor = Colors.white;
  static const Color kGreyColor = Colors.grey;
  static const Color kBlueColor = Colors.blue;
  static const Color kLightBlueColor = Color.fromARGB(255, 140, 255, 236);
  static const Color kBrownColor = Colors.brown;
  static const Color kMainTitleColor = Color(0xff1D1616);
  static const Color kRedColor = Colors.redAccent;

  //Filter Chip Container
  static const Color kFChipContainerColor1 = Color(0xffFCC6FF);
  static const Color kFChipContainerColor2 = Color(0xffFFE6C9);
  static const Gradient kFChipContainerColor = LinearGradient(
    colors: [
      kFChipContainerColor1,
      kFChipContainerColor2,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  //Mindful Card
  static const Color kMindfulCardColor1 = Color(0xffA1E3F9);
  static const Color kMindfulCardColor2 = Color(0xffD1F8EF);
  static const Gradient kMindfulCardColor = LinearGradient(
    colors: [
      kMindfulCardColor1,
      kMindfulCardColor2,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  //Meditation Card
  static const Color kMeditationCardColor1 = Color(0xffE5D0AC);
  static const Color kMeditationCardColor2 = Color(0xffFEF9E1);
  static const Gradient kMeditationCardColor = LinearGradient(
    colors: [
      kMeditationCardColor1,
      kMeditationCardColor2,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  //Sleep Card
  static const Color kSleepCardColor1 = Color(0xffB2A5FF);
  static const Color kSleepCardColor2 = Color(0xffDAD2FF);
  static const Gradient kSleepCardColor = LinearGradient(
    colors: [
      kSleepCardColor1,
      kSleepCardColor2,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
