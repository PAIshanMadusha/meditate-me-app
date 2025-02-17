import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meditate_me_app/models/meditation_exercise_model.dart';
import 'package:meditate_me_app/models/mindful_exercise_model.dart';
import 'package:meditate_me_app/models/sleep_exercise_model.dart';
import 'package:meditate_me_app/providers/custom_data_provider.dart';
import 'package:meditate_me_app/providers/filter_provider.dart';
import 'package:meditate_me_app/providers/meditation_provider.dart';
import 'package:meditate_me_app/providers/mindful_exercise_provider.dart';
import 'package:meditate_me_app/providers/sleep_exercise_provider.dart';
import 'package:meditate_me_app/router/router_class.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(MeditationExerciseModelAdapter());
  Hive.registerAdapter(MindfulExerciseModelAdapter());
  Hive.registerAdapter(SleepExerciseModelAdapter());

  await Hive.openBox("meditation_data");
  await Hive.openBox("mindful_data");
  await Hive.openBox("sleep_data");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MindfulExerciseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MeditationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SleepExerciseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FilterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomDataProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "MeditateMe App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      routerConfig: RouterClass().router,
    );
  }
}
