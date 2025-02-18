import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';
import 'package:meditate_me_app/widgets/tabs/meditation_exercise_tab.dart';
import 'package:meditate_me_app/widgets/tabs/mindful_exercise_tab.dart';
import 'package:meditate_me_app/widgets/tabs/sleep_exercise_tab.dart';

class CustomExercisePage extends StatelessWidget {
  const CustomExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Custom Exercises",
            style: AppTextStyle.kMainTitleStyle.copyWith(
              color: AppColors.kBlackColor,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            dividerColor: AppColors.kWhiteColor,
            indicatorColor: AppColors.kBlueColor,
            indicatorWeight: 4,
            labelStyle: AppTextStyle.kTitleStyle.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              // ignore: deprecated_member_use
              color: AppColors.kBlackColor.withOpacity(0.8),
            ),
            unselectedLabelStyle: AppTextStyle.kTitleStyle.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              // ignore: deprecated_member_use
              color: AppColors.kBlackColor.withOpacity(0.9),
            ),
            tabs: [
              Tab(
                text: "Meditation",
              ),
              Tab(
                text: "Mindfulness",
              ),
              Tab(
                text: "Sleep",
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // ignore: deprecated_member_use
          backgroundColor: AppColors.kBlueColor.withOpacity(0.8),
          onPressed: () {
            GoRouter.of(context).push("/createPage");
          },
          child: Icon(
            Icons.add,
            color: AppColors.kWhiteColor,
            size: 34,
          ),
        ),
        body: const TabBarView(
          children: [
            MeditationExerciseTab(),
            MindfulExerciseTab(),
            SleepExerciseTab(),
          ],
        ),
      ),
    );
  }
}
