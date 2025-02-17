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

      if (context.mounted) {
        AppHelper.showSnackBar(context, "Meditation Added Successfully!");
      }
    } catch (error) {
      if (context.mounted) {
        AppHelper.showSnackBar(context, "Error $error");
      }
    }
  }

  //Get All Meditation
  List<MeditationExerciseModel> getMeditation() {
    try {
      final dynamic allMeditation = meditationBox.get("meditation_data");
      if (allMeditation != null && allMeditation is List) {
        return allMeditation.map((meditation) {
          if (meditation is Map<String, dynamic>) {
            return MeditationExerciseModel.fromJson(meditation);
          } else {
            return MeditationExerciseModel.fromJson(
                Map<String, dynamic>.from(meditation));
          }
        }).toList();
      } else {
        return [];
      }
    } catch (error) {
      error.toString();
      return [];
    }
  }

  //Delete a Meditation
  Future<void> deleteMeditation(
      MeditationExerciseModel meditationExercise, BuildContext context) async {
    try {
      final dynamic allMeditations = meditationBox.get("meditation_data");
      if (allMeditations != null && allMeditations is List) {
        List<Map<String, dynamic>> meditationList =
            List<Map<String, dynamic>>.from(allMeditations
                .map((meditation) => Map<String, dynamic>.from(meditation)));

        meditationList.removeWhere((meditation) {
          MeditationExerciseModel currentMeditation =
              MeditationExerciseModel.fromJson(
            Map<String, dynamic>.from(meditation),
          );
          return currentMeditation.name == meditationExercise.name &&
              currentMeditation.category == meditationExercise.category;
        });

        await meditationBox.put("meditation_data", meditationList);

        if(context.mounted) {
          AppHelper.showSnackBar(context, "Meditation Deleted Successfully!");
        }
      }
    } catch (error) {
      if(context.mounted) {
        AppHelper.showSnackBar(context, "Error: $error");
      }
    }
  }
}
