import 'package:flutter/material.dart';
import 'package:meditate_me_app/models/mindful_exercise_model.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_constances.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class MindfulExerciseSinglePage extends StatelessWidget {
  final MindfulExerciseModel mindfulExercise;
  const MindfulExerciseSinglePage({
    super.key,
    required this.mindfulExercise,
  });

  Future <void> _lunchUrl(String url) async{
    final Uri uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }else{
      throw "Could not Lanch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "More Details",
          style: AppTextStyle.kMainTitleStyle.copyWith(
            fontSize: 26,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            AppConstances.kPaddingValue,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(
                  AppConstances.kPaddingValue,
                ),
                width: double.infinity,
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
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mindfulExercise.name,
                      style: AppTextStyle.kTitleStyle,
                    ),
                    SizedBox(
                      height: AppConstances.kSizedBoxValue,
                    ),
                    Text(
                      mindfulExercise.category,
                      style: AppTextStyle.kTitleStyle.copyWith(
                        color: AppColors.kWhiteColor,
                      ),
                    ),
                    SizedBox(
                      height: AppConstances.kSizedBoxValue,
                    ),
                    Text(
                      mindfulExercise.description,
                      style: AppTextStyle.kSmallDescriptionStyle,
                    ),
                    SizedBox(
                      height: AppConstances.kSizedBoxValue,
                    ),
                    Text(
                      "Instructions",
                      style: AppTextStyle.kTitleStyle.copyWith(
                        color: AppColors.kWhiteColor,
                      ),
                    ),
                    ...mindfulExercise.instructions.map(
                      (instruction) => Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppConstances.kPaddingValue,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.integration_instructions_sharp,
                              size: 20,
                              color: AppColors.kBrownColor,
                            ),
                            SizedBox(
                              width: AppConstances.kSizedBoxValue,
                            ),
                            Expanded(
                              child: Text(
                                instruction,
                                style: AppTextStyle.kSmallDescriptionStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppConstances.kSizedBoxValue,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 35,
                          color: AppColors.kWhiteColor,
                        ),
                        SizedBox(
                          width: AppConstances.kSizedBoxValue,
                        ),
                        Text(
                          "${mindfulExercise.duration.toString()} Min",
                          style: AppTextStyle.kTitleStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppConstances.kSizedBoxValue,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.kBlueColor,
                            ),
                          ),
                          onPressed: () async{
                            await _lunchUrl(mindfulExercise.instructionsUrl);
                          },
                          child: Text(
                            "View Detailed Instructions",
                            style: AppTextStyle.kBodyStyle.copyWith(
                              color: AppColors.kWhiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
