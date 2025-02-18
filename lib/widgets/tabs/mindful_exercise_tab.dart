import 'package:flutter/material.dart';
import 'package:meditate_me_app/models/mindful_exercise_model.dart';
import 'package:meditate_me_app/providers/custom_data_provider.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_constances.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MindfulExerciseTab extends StatelessWidget {
  const MindfulExerciseTab({super.key});

  Future<void> _lunchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
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
              builder: (context, mindfulData, child) {
                final List<MindfulExerciseModel> mindfulExercises =
                    mindfulData.getMindfulExercises();
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: mindfulExercises.length,
                  itemBuilder: (context, index) {
                    MindfulExerciseModel mindfulExercise =
                        mindfulExercises[index];
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
                        gradient: AppColors.kMindfulCardColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.kMindfulCardColor1,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              40,
                            ),
                            child: mindfulExercise.imagePath == ""
                                ? SizedBox()
                                : Image.asset(
                                    mindfulExercise.imagePath,
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          SizedBox(
                            height: AppConstances.kSizedBoxValue,
                          ),
                          Text(
                            mindfulExercise.name,
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
                            mindfulExercise.category,
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
                            mindfulExercise.description,
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
                                    color: AppColors.kFChipContainerColor1,
                                  ),
                                  SizedBox(
                                    width: AppConstances.kSizedBoxValue,
                                  ),
                                  Expanded(
                                    child: Text(
                                      instruction,
                                      style:
                                          AppTextStyle.kSmallDescriptionStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppConstances.kSizedBoxValue,
                          ),
                          Text(
                            "${mindfulExercise.duration.toString()} Min",
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
                                    mindfulExercise.instructionsUrl,
                                  );
                                },
                                icon: Icon(
                                  Icons.integration_instructions_sharp,
                                  size: 40,
                                  color: AppColors.kBlueColor,
                                ),
                              ),
                              SizedBox(
                                width: AppConstances.kSizedBoxValue,
                              ),
                              IconButton(
                                onPressed: () {
                                  mindfulData.deleteMindfulExercise(
                                      mindfulExercise, context);
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
