import 'package:flutter/material.dart';
import 'package:meditate_me_app/helpers/app_helper.dart';
import 'package:meditate_me_app/models/meditation_exercise_model.dart';
import 'package:meditate_me_app/services/meditation_service.dart';

class CustomDataProvider extends ChangeNotifier{

  final List<MeditationExerciseModel> _meditation = [];

  //Getter
  List<MeditationExerciseModel> get meditaions => _meditation;

  //Add a New Meditation
  void addMeditation(MeditationExerciseModel meditation, BuildContext context){

    try{
      _meditation.add(meditation);

      try{
        MeditationService().addMeditation(meditation, context);
      }catch(error){
        if(context.mounted){
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

}