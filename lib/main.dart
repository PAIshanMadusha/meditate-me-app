import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditate_me_app/providers/filter_provider.dart';
import 'package:meditate_me_app/providers/meditation_provider.dart';
import 'package:meditate_me_app/providers/mindful_exercise_provider.dart';
import 'package:meditate_me_app/providers/sleep_exercise_provider.dart';
import 'package:meditate_me_app/router/router_class.dart';
import 'package:provider/provider.dart';

void main() {
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
