import 'package:flutter/material.dart';
import 'package:meditate_me_app/models/sleep_exercise_model.dart';
import 'package:meditate_me_app/providers/custom_data_provider.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_constances.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SleepExerciseTab extends StatelessWidget {
  const SleepExerciseTab({super.key});

  Future<void> _lunchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await launchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw "Could not Launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(
          AppConstances.kPaddingValue,
        ),
        child: Column(
          children: [
            Consumer<CustomDataProvider>(
              builder: (context, sleepData, child) {
                final List<SleepExerciseModel> sleepExercises =
                    sleepData.getSleepExercises();
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: sleepExercises.length,
                  itemBuilder: (context, index) {
                    SleepExerciseModel sleepExercise = sleepExercises[index];
                    return Container(
                      margin: EdgeInsets.only(
                        bottom: AppConstances.kPaddingValue,
                      ),
                      padding: EdgeInsets.all(
                        AppConstances.kPaddingValue,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          15,
                        ),
                        gradient: AppColors.kSleepCardColor,
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: AppColors.kSleepCardColor1.withOpacity(0.8),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            sleepExercise.name,
                            style: AppTextStyle.kTitleStyle.copyWith(
                              color: AppColors.kBlackColor
                                  // ignore: deprecated_member_use
                                  .withOpacity(0.7),
                            ),
                          ),
                          SizedBox(
                            height: AppConstances.kSizedBoxValue,
                          ),
                          Text(
                            sleepExercise.category,
                            style: AppTextStyle.kTitleStyle.copyWith(
                              color: AppColors.kBlackColor
                                  // ignore: deprecated_member_use
                                  .withOpacity(0.45),
                            ),
                          ),
                          SizedBox(
                            height: AppConstances.kSizedBoxValue,
                          ),
                          Text(
                            sleepExercise.description,
                            style: AppTextStyle.kSmallDescriptionStyle.copyWith(
                              color: AppColors.kBlackColor
                                  // ignore: deprecated_member_use
                                  .withOpacity(0.4),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: AppConstances.kSizedBoxValue,
                          ),
                          Text(
                            "${sleepExercise.duration.toString()} Min",
                            style: AppTextStyle.kTitleStyle.copyWith(
                              color: AppColors.kWhiteColor,
                            ),
                          ),
                          SizedBox(
                            height: AppConstances.kSizedBoxValue,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await _lunchUrl(
                                    sleepExercise.audioUrl,
                                  );
                                },
                                icon: Icon(
                                  Icons.audiotrack_rounded,
                                  size: 45,
                                  color: AppColors.kBlueColor,
                                ),
                              ),
                              SizedBox(
                                width: AppConstances.kSizedBoxValue,
                              ),
                              IconButton(
                                onPressed: () {
                                  sleepData.deleteSleepExercise(
                                      sleepExercise, context);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  size: 40,
                                  color: AppColors.kRedColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
