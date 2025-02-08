import 'package:flutter/material.dart';
import 'package:meditate_me_app/models/mindful_exercise_model.dart';
import 'package:meditate_me_app/models/sleep_exercise_model.dart';
import 'package:meditate_me_app/providers/filter_provider.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_constances.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                                width: MediaQuery.of(context).size.width * 0.26,
                              ),
                            ),
                            SizedBox(
                              width: AppConstances.kSizedBoxValue,
                            ),
                            Text(
                              "MeditateMe",
                              style: AppTextStyle.mainTitleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppConstances.kSizedBoxValue,
                        ),
                        Text(
                          "Select a Category to Start Exploring",
                          style: AppTextStyle.titleStyle,
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
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: AppConstances.kPaddingValue,
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  FilterChip(
                                    label: Text(
                                      "All",
                                    ),
                                    onSelected: (value) {},
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Mindfulness",
                                    ),
                                    onSelected: (value) {},
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Meditation",
                                    ),
                                    onSelected: (value) {},
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FilterChip(
                                    label: Text(
                                      "Sleep Stories",
                                    ),
                                    onSelected: (value) {},
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
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      15,
                                    ),
                                    color: data is MindfulExerciseModel
                                        ? AppColors.kFChipContainerColor2
                                        : data is SleepExerciseModel
                                            ? AppColors.kMainTitleColor
                                            : AppColors.kBlueColor,
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
                                              AppTextStyle.titleStyle.copyWith(
                                            color: AppColors.kWhiteColor,
                                          ),
                                        ),
                                        Text(
                                          data.category,
                                          style:
                                              AppTextStyle.titleStyle.copyWith(
                                            color: AppColors.kGreyColor,
                                          ),
                                        ),
                                        Text(
                                          "${data.duration} min",
                                          style:
                                              AppTextStyle.titleStyle.copyWith(
                                            color: AppColors.kMainTitleColor,
                                          ),
                                        ),
                                        Text(
                                          data.description,
                                          style:
                                              AppTextStyle.titleStyle.copyWith(
                                            fontSize: 15,
                                            color:
                                                AppColors.kFChipContainerColor1,
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
