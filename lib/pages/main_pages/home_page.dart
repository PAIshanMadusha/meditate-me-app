import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditate_me_app/models/meditation_exercise_model.dart';
import 'package:meditate_me_app/models/mindful_exercise_model.dart';
import 'package:meditate_me_app/models/sleep_exercise_model.dart';
import 'package:meditate_me_app/models/youtube_player_page_data.dart';
import 'package:meditate_me_app/providers/filter_provider.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_constances.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //When MindfulExercise Pressed
  void handleMindfulExercisePressed() {}

  //When Meditation Exercise Pressed
  void handleMeditationExercisePressed(
    BuildContext context,
    final name,
    final category,
    final description,
    final duration,
    final videoUrl,
  ) {
    showModalBottomSheet(
      backgroundColor: AppColors.kWhiteColor,
      // ignore: deprecated_member_use
      barrierColor: AppColors.kWhiteColor.withOpacity(0.3),
      context: context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(
              AppConstances.kPaddingValue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: AppTextStyle.kTitleStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppConstances.kSizedBoxValue,
                ),
                Text(
                  category,
                  style: AppTextStyle.kTitleStyle.copyWith(
                    color: AppColors.kGreyColor,
                  ),
                ),
                SizedBox(
                  height: AppConstances.kSizedBoxValue,
                ),
                Text(
                  description,
                  style: AppTextStyle.kSmallDescriptionStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: AppConstances.kSizedBoxValue,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.timelapse_sharp,
                      size: 30,
                      color: AppColors.kBlueColor,
                    ),
                    SizedBox(
                      width: AppConstances.kSizedBoxValue - 5,
                    ),
                    Text(
                      "${duration.toString()} Min",
                      style: AppTextStyle.kTitleStyle.copyWith(
                        color: AppColors.kBlueColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppConstances.kSizedBoxValue * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.kBlueColor,
                        ),
                        shadowColor: WidgetStatePropertyAll(
                          AppColors.kBlueColor,
                        ),
                      ),
                      onPressed: () {
                        GoRouter.of(context).push(
                          "/youtubePlayerPage",
                          extra: YoutubePlayerPageData(
                            title: name,
                            category: category,
                            description: description,
                            duration: duration,
                            url: videoUrl,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Start",
                        style: AppTextStyle.kBodyStyle.copyWith(
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppConstances.kSizedBoxValue,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.kGreyColor,
                        ),
                        shadowColor: WidgetStatePropertyAll(
                          AppColors.kGreyColor,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Close",
                        style: AppTextStyle.kBodyStyle.copyWith(
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //When Sleep Exercise Pressed
  void handleSleepExercisePressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Provider.of<FilterProvider>(context, listen: false)
              .getData(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error Loadning Data"),
              );
            }
            return Consumer<FilterProvider>(
              builder: (context, filterData, child) {
                final completedData = filterData.filterData;
                completedData.shuffle();
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      AppConstances.kPaddingValue,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                100,
                              ),
                              child: Image.asset(
                                "assets/images/treelogo.jpg",
                                width: MediaQuery.of(context).size.width * 0.28,
                              ),
                            ),
                            SizedBox(
                              width: AppConstances.kSizedBoxValue,
                            ),
                            Text(
                              "MeditateMe",
                              style: AppTextStyle.kMainTitleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppConstances.kSizedBoxValue,
                        ),
                        Text(
                          "Select a Category to Start Exploring",
                          style: AppTextStyle.kTitleStyle,
                        ),
                        SizedBox(
                          height: AppConstances.kSizedBoxValue,
                        ),
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                            border: Border.all(
                              // ignore: deprecated_member_use
                              color: AppColors.kFChipContainerColor2
                                  // ignore: deprecated_member_use
                                  .withOpacity(0.2),
                              width: 2.5,
                            ),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                            gradient: AppColors.kFChipContainerColor,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.kFChipContainerColor2,
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: AppConstances.kPaddingValue,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  //All
                                  FilterChip(
                                    label: Text(
                                      "All",
                                      style: AppTextStyle.kSmallDescriptionStyle
                                          .copyWith(
                                        color:
                                            filterData.getSelectedCategory() ==
                                                    "All"
                                                ? AppColors.kWhiteColor
                                                : AppColors.kGreyColor,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filteredData("All");
                                    },
                                    selected:
                                        filterData.getSelectedCategory() ==
                                            "All",
                                    selectedColor: AppColors.kLightBlueColor,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        8,
                                      ),
                                      side: BorderSide(
                                        color: AppColors.kWhiteColor,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),

                                  //Mindful
                                  FilterChip(
                                    label: Text(
                                      "Mindfulness",
                                      style: AppTextStyle.kSmallDescriptionStyle
                                          .copyWith(
                                        color:
                                            filterData.getSelectedCategory() ==
                                                    "Mindfulness"
                                                ? AppColors.kWhiteColor
                                                : AppColors.kGreyColor,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filteredData("Mindfulness");
                                    },
                                    selected:
                                        filterData.getSelectedCategory() ==
                                            "Mindfulness",
                                    selectedColor: AppColors.kLightBlueColor,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          8,
                                        ),
                                        side: BorderSide(
                                          color: AppColors.kWhiteColor,
                                          width: 1,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),

                                  //Meditation
                                  FilterChip(
                                    label: Text(
                                      "Meditation",
                                      style: AppTextStyle.kSmallDescriptionStyle
                                          .copyWith(
                                        color:
                                            filterData.getSelectedCategory() ==
                                                    "Meditation"
                                                ? AppColors.kWhiteColor
                                                : AppColors.kGreyColor,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filteredData("Meditation");
                                    },
                                    selected:
                                        filterData.getSelectedCategory() ==
                                            "Meditation",
                                    selectedColor: AppColors.kLightBlueColor,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        8,
                                      ),
                                      side: BorderSide(
                                        color: AppColors.kWhiteColor,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),

                                  //Sleep Stories
                                  FilterChip(
                                    label: Text(
                                      "Sleep Stories",
                                      style: AppTextStyle.kSmallDescriptionStyle
                                          .copyWith(
                                        color:
                                            filterData.getSelectedCategory() ==
                                                    "Sleep Stories"
                                                ? AppColors.kWhiteColor
                                                : AppColors.kGreyColor,
                                      ),
                                    ),
                                    onSelected: (bool value) {
                                      filterData.filteredData("Sleep Stories");
                                    },
                                    selected:
                                        filterData.getSelectedCategory() ==
                                            "Sleep Stories",
                                    selectedColor: AppColors.kLightBlueColor,
                                    showCheckmark: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        8,
                                      ),
                                      side: BorderSide(
                                        color: AppColors.kWhiteColor,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppConstances.kSizedBoxValue,
                        ),
                        if (completedData.isNotEmpty)
                          StaggeredGrid.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: completedData.map((data) {
                              return GestureDetector(
                                onTap: () {
                                  if (data is MindfulExerciseModel) {
                                    handleMindfulExercisePressed();
                                  } else if (data is MeditationExerciseModel) {
                                    handleMeditationExercisePressed(
                                      context,
                                      data.name,
                                      data.category,
                                      data.description,
                                      data.duration,
                                      data.videoUrl,
                                    );
                                  } else {
                                    handleSleepExercisePressed();
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      15,
                                    ),
                                    gradient: data is MindfulExerciseModel
                                        ? AppColors.kMindfulCardColor
                                        : data is SleepExerciseModel
                                            ? AppColors.kMeditationCardColor
                                            : AppColors.kSleepCardColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.kFChipContainerColor2
                                            // ignore: deprecated_member_use
                                            .withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      AppConstances.kPaddingValue,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.name,
                                          style:
                                              AppTextStyle.kTitleStyle.copyWith(
                                            color: AppColors.kBlackColor
                                                // ignore: deprecated_member_use
                                                .withOpacity(0.7),
                                          ),
                                        ),
                                        Text(
                                          data.category,
                                          style:
                                              AppTextStyle.kTitleStyle.copyWith(
                                            color: AppColors.kBlackColor
                                                // ignore: deprecated_member_use
                                                .withOpacity(0.35),
                                          ),
                                        ),
                                        Text(
                                          "${data.duration} min",
                                          style:
                                              AppTextStyle.kTitleStyle.copyWith(
                                            color: AppColors.kWhiteColor,
                                          ),
                                        ),
                                        Text(
                                          data.description,
                                          style: AppTextStyle
                                              .kSmallDescriptionStyle
                                              .copyWith(
                                            color: AppColors.kBlackColor
                                                // ignore: deprecated_member_use
                                                .withOpacity(0.3),
                                          ),
                                          maxLines:
                                              (data.description.length / 2)
                                                  .toInt(),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
