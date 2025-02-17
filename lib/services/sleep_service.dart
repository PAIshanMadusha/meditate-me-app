import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meditate_me_app/helpers/app_helper.dart';
import 'package:meditate_me_app/models/sleep_exercise_model.dart';

class SleepService {
  var sleepBox = Hive.box("sleep_data");

  //Add a new Sleep Exercise
  Future<void> addSleepExercise(
      SleepExerciseModel sleepExercise, BuildContext context) async {
    try {
      final allSleepExercises = sleepBox.get("sleep_data") ?? [];

      await allSleepExercises.add(sleepExercise);

      await sleepBox.put("sleep_data", allSleepExercises);
      
      if (context.mounted) {
        AppHelper.showSnackBar(context, "Sleep Exercise Added Successfully!");
      }
    } catch (error) {
      if (context.mounted) {
        AppHelper.showSnackBar(context, "Error $error");
      }
    }
  }
}
