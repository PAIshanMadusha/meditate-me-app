import 'package:flutter/material.dart';
import 'package:meditate_me_app/helpers/app_helper.dart';
import 'package:meditate_me_app/models/meditation_exercise_model.dart';
import 'package:meditate_me_app/models/mindful_exercise_model.dart';
import 'package:meditate_me_app/models/sleep_exercise_model.dart';
import 'package:meditate_me_app/services/meditation_service.dart';
import 'package:meditate_me_app/services/mindful_service.dart';
import 'package:meditate_me_app/services/sleep_service.dart';

class CustomDataProvider extends ChangeNotifier {
  final List<MeditationExerciseModel> _meditation = [];
  final List<SleepExerciseModel> _sleepExercise = [];
  final List<MindfulExerciseModel> _mindfulExercise = [];

  //Getter
  List<MeditationExerciseModel> get meditaions => _meditation;
  List<SleepExerciseModel> get sleepExercises => _sleepExercise;
  List<MindfulExerciseModel> get mindfulExercises => _mindfulExercise;

  //Add a New Meditation
  void addMeditation(MeditationExerciseModel meditation, BuildContext context) {
    try {
      _meditation.add(meditation);

      try {
        MeditationService().addMeditation(meditation, context);
      } catch (error) {
        if (context.mounted) {
          AppHelper.showSnackBar(context, "Error $error");
        }
      }
      notifyListeners();
    } catch (error) {
      if (context.mounted) {
        AppHelper.showSnackBar(context, "Error: $error");
      }
    }
  }

  //Add a New SleepExercise
  void addSleepExercise(SleepExerciseModel sleepExercise, BuildContext context){
    try{
      _sleepExercise.add(sleepExercise);
      try{
        SleepService().addSleepExercise(sleepExercise, context);

      }catch(error){
        if(context.mounted) {
          AppHelper.showSnackBar(context, "Error $error");
        }
      }
      notifyListeners();
    }catch(error){
      if(context.mounted){
        AppHelper.showSnackBar(context, "Error: $error");
      }
    }
  }

  //Add a new MindfulExercise
  void addMindfulExercise(MindfulExerciseModel mindfulExercise, BuildContext context){
    try{
      _mindfulExercise.add(mindfulExercise);
      try{
        MindfulService().addMindfulExercise(mindfulExercise, context);
      }catch(error){
        if(context.mounted){
          AppHelper.showSnackBar(context, "Error: $error");
        }
      }
      notifyListeners();
    }catch(error){
      if(context.mounted){
        AppHelper.showSnackBar(context, "Error $error");
      }
    }
  }
}
