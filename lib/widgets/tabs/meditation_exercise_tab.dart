import 'package:flutter/material.dart';
import 'package:meditate_me_app/models/meditation_exercise_model.dart';
import 'package:meditate_me_app/providers/custom_data_provider.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_constances.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MeditationExerciseTab extends StatelessWidget {
  const MeditationExerciseTab({super.key});

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
            builder: (context, meditationsData, child) {
              final List<MeditationExerciseModel> meditations =
                  meditationsData.getMeditations();

              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: meditations.length,
                itemBuilder: (context, index) {
                  MeditationExerciseModel meditation = meditations[index];
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
                      gradient: AppColors.kMeditationCardColor,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.kMeditationCardColor1,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0.5, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          meditation.name,
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
                          meditation.category,
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
                          meditation.description,
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
                          "${meditation.duration.toString()} Min",
                          style: AppTextStyle.kTitleStyle.copyWith(
                            color: AppColors.kWhiteColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () async {
                                await _lunchUrl(meditation.videoUrl);
                              },
                              icon: Icon(
                                Icons.video_call_rounded,
                                size: 45,
                                color: AppColors.kBlueColor,
                              ),
                            ),
                            SizedBox(
                              width: AppConstances.kSizedBoxValue,
                            ),
                            IconButton(
                              onPressed: () async {
                                await _lunchUrl(meditation.audioUrl);
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
                                meditationsData.deleteMeditation(
                                    meditation, context);
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
          )
        ],
      ),
    ));
  }
}
