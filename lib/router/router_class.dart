import 'dart:convert';
import 'package:go_router/go_router.dart';
import 'package:meditate_me_app/models/mindful_exercise_model.dart';
import 'package:meditate_me_app/models/sleep_exercise_model.dart';
import 'package:meditate_me_app/models/youtube_player_page_data.dart';
import 'package:meditate_me_app/pages/main_page.dart';
import 'package:meditate_me_app/pages/mindful_exercise_single_page.dart';
import 'package:meditate_me_app/pages/mindful_exercise_timer_page.dart';
import 'package:meditate_me_app/pages/sleep_exercise_timer_page.dart';
import 'package:meditate_me_app/pages/youtube_player_page.dart';
import 'package:meditate_me_app/router/route_names.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: RouteNames.mainPage,
        builder: (context, state) {
          return const MainPage();
        },
      ),
      GoRoute(
        path: "/mindfulExercise",
        name: RouteNames.mindfulExerciseSinglePage,
        builder: (context, state) {
          final mindfulExerciseJson =
              state.uri.queryParameters["mindfulExercises"];
          final mindfulExercise =
              MindfulExerciseModel.fromJson(jsonDecode(mindfulExerciseJson!));
          return MindfulExerciseSinglePage(
            mindfulExercise: mindfulExercise,
          );
        },
      ),
      GoRoute(
        path: "/youtubePlayerPage",
        name: RouteNames.youtubePlayerPage,
        builder: (context, state) {
          final YoutubePlayerPageData youtubePlayerPageData =
              state.extra as YoutubePlayerPageData;
          return YoutubePlayerPage(
              youtubePlayerPageData: youtubePlayerPageData);
        },
      ),
      GoRoute(
        path: "/mindfulExerciseTimerPage",
        name: RouteNames.mindfulExerciseTimerPage,
        builder: (context, state) {
          final mindfulExerciseJson =
              state.uri.queryParameters["mindfulExercise"];
          final mindfulExercise =
              MindfulExerciseModel.fromJson(jsonDecode(mindfulExerciseJson!));
          return MindfulExerciseTimerPage(
            mindfulExerciseModel: mindfulExercise,
          );
        },
      ),
      GoRoute(
        path: "/sleepExerciseTimerPage",
        name: RouteNames.sleepExerciseTimerPage,
        builder: (context, state) {
          final sleepExerciseJson = state.uri.queryParameters["sleepExercise"];
          final sleepExercise =
              SleepExerciseModel.fromJson(jsonDecode(sleepExerciseJson!));
          return SleepExerciseTimerPage(
            sleepExerciseModel: sleepExercise,
          );
        },
      ),
    ],
  );
}
