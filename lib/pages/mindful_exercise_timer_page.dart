import 'package:flutter/material.dart';
import 'package:meditate_me_app/models/mindful_exercise_model.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_constances.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';

class MindfulExerciseTimerPage extends StatelessWidget {
  final MindfulExerciseModel mindfulExerciseModel;
  const MindfulExerciseTimerPage({
    super.key,
    required this.mindfulExerciseModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mindfulExerciseModel.name,
          style: AppTextStyle.kTitleStyle.copyWith(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            AppConstances.kPaddingValue,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15,
              ),
              gradient: AppColors.kMindfulCardColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.kMindfulCardColor2,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(1, 1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                AppConstances.kPaddingValue,
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      40,
                    ),
                    child: Image.asset(
                      mindfulExerciseModel.imagePath,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: AppConstances.kSizedBoxValue,
                  ),
                  Text(
                    mindfulExerciseModel.category,
                    style: AppTextStyle.kTitleStyle.copyWith(
                      color: AppColors.kGreyColor,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: AppConstances.kSizedBoxValue,
                  ),
                  Text(
                    mindfulExerciseModel.name,
                    style: AppTextStyle.kTitleStyle.copyWith(
                      // ignore: deprecated_member_use
                      color: AppColors.kBlackColor.withOpacity(
                        0.6,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppConstances.kSizedBoxValue,
                  ),
                  Text(
                    "Duration: ${mindfulExerciseModel.duration.toString()} Min",
                    style: AppTextStyle.kTitleStyle.copyWith(
                      color: AppColors.kWhiteColor,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: AppConstances.kSizedBoxValue,
                  ),
                  Text(
                    mindfulExerciseModel.description,
                    style: AppTextStyle.kSmallDescriptionStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: AppConstances.kSizedBoxValue,
                  ),
                  Text(
                    "Instructions",
                    style: AppTextStyle.kTitleStyle.copyWith(
                      color: AppColors.kWhiteColor,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: AppConstances.kSizedBoxValue,
                  ),
                  ...mindfulExerciseModel.instructions.map(
                    (instruction) => Padding(
                      padding: EdgeInsets.all(
                        AppConstances.kPaddingValue,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(
                          AppConstances.kPaddingValue,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          gradient: AppColors.kFChipContainerColor,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.kFChipContainerColor1,
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.insert_chart_outlined_outlined,
                              size: 35,
                            ),
                            SizedBox(
                              width: AppConstances.kSizedBoxValue,
                            ),
                            Expanded(
                              child: Text(
                                instruction,
                                style: AppTextStyle.kSmallDescriptionStyle
                                    .copyWith(
                                  color: AppColors.kGreyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
