import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meditate_me_app/helpers/app_helper.dart';
import 'package:meditate_me_app/models/mindful_exercise_model.dart';

class MindfulService {
  var mindfulBox = Hive.box("mindful_data");

  //Add a New Mindful Exercise
  Future<void> addMindfulExercise(
      MindfulExerciseModel mindfulExercise, BuildContext context) async {
    try {
      final allMindfulExercise = mindfulBox.get("mindful_data") ?? [];

      allMindfulExercise.add(mindfulExercise);

      await mindfulBox.put("mindful_data", allMindfulExercise);

      if (context.mounted) {
        AppHelper.showSnackBar(context, "Mindful Exercise Added Successfully!");
      }
    } catch (error) {
      if (context.mounted) {
        AppHelper.showSnackBar(context, "Error: $error");
      }
    }
  }

  //Get All MindfulExercises
  List<MindfulExerciseModel> getMindfulExercises() {
    try {
      final allMindfulExercises = mindfulBox.get("mindful_data");

      if (allMindfulExercises != null && allMindfulExercises is List<dynamic>) {
        return allMindfulExercises.cast<MindfulExerciseModel>().toList();
      } else {
        return [];
      }
    } catch (error) {
      error.toString();
      return [];
    }
  }

  //Delete a MindfulExercise
  Future<void> deleteMindfulExercise(
      MindfulExerciseModel mindfulExercise, BuildContext context) async {
    try {
      final allMindfulExercises = mindfulBox.get("mindful_data");
      allMindfulExercises.remove(mindfulExercise);

      await mindfulBox.put("mindful_data", allMindfulExercises);

      if (context.mounted) {
        AppHelper.showSnackBar(
            context, "MindfulExercise Deleted Successfully!");
      }
    } catch (error) {
      if (context.mounted) {
        AppHelper.showSnackBar(context, "Error: $error");
      }
    }
  }
}
