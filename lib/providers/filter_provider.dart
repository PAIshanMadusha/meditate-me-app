import 'package:flutter/material.dart';
import 'package:meditate_me_app/models/meditation_exercise_model.dart';
import 'package:meditate_me_app/models/mindful_exercise_model.dart';
import 'package:meditate_me_app/models/sleep_exercise_model.dart';
import 'package:meditate_me_app/providers/meditation_provider.dart';
import 'package:meditate_me_app/providers/mindful_exercise_provider.dart';
import 'package:meditate_me_app/providers/sleep_exercise_provider.dart';
import 'package:provider/provider.dart';

class FilterProvider extends ChangeNotifier {
  List<dynamic> _allData = [];
  List<dynamic> _filteredData = [];

  //Get All the Data form Other Providers
  Future<void> getData(BuildContext context) async {
    //Ensure This Runs After Build
    await Future.delayed(Duration.zero);

    //Get Mindful Exercises
    final List<MindfulExerciseModel> mindfulExercises =
        // ignore: use_build_context_synchronously
        Provider.of<MindfulExerciseProvider>(context, listen: false)
            .mindfulExercises;

    //get Meditation Exercises
    final List<MeditationExerciseModel> meditationExercises =
        // ignore: use_build_context_synchronously
        Provider.of<MeditationProvider>(context, listen: false)
            .meditationExercises;

    //Get Sleep Exercises
    final List<SleepExerciseModel> sleepExercises =
        // ignore: use_build_context_synchronously
        Provider.of<SleepExerciseProvider>(context, listen: false)
            .sleepExercises;

    _allData = [
      ...mindfulExercises,
      ...meditationExercises,
      ...sleepExercises,
    ];

    _filteredData = _allData;
    notifyListeners();
  }
  //Getter
  List<dynamic> get filterData => _filteredData;
}
