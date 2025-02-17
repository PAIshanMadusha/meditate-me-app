import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meditate_me_app/helpers/app_helper.dart';
import 'package:meditate_me_app/models/meditation_exercise_model.dart';

class MeditationService {
  var meditationBox = Hive.box("meditation_data");

  //Add a New Meditaion
  Future<void> addMeditation(
      MeditationExerciseModel meditation, BuildContext context) async {
    try {
      final dynamic allMeditations = meditationBox.get("meditation_data");
      List<Map<String, dynamic>> meditationList = [];

      if (allMeditations != null && allMeditations is List) {
        meditationList = List<Map<String, dynamic>>.from(
          allMeditations.map(
            (meditation) => Map<String, dynamic>.from(meditation),
          ),
        );
      }
      meditationList.add(meditation.toJson());

      await meditationBox.put("meditation_data", meditationList);

      if(context.mounted) {
        AppHelper.showSnackBar(context, "Meditation Added Successfully!");
      }

    } catch (error) {
      if(context.mounted) {
        AppHelper.showSnackBar(context, "Error $error");
      }
    }
  }
}
