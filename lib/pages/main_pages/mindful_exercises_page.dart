import 'package:flutter/material.dart';
import 'package:meditate_me_app/models/mindful_exercise_model.dart';
import 'package:meditate_me_app/providers/mindful_exercise_provider.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_constances.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';
import 'package:provider/provider.dart';

class MindfulExercisesPage extends StatelessWidget {
  const MindfulExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mindful Exercises",
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
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  // ignore: deprecated_member_use
                  prefixIconColor: AppColors.kMainTitleColor.withOpacity(0.1),
                  hintText: "Search",
                  hintStyle: AppTextStyle.kTitleStyle.copyWith(
                    // ignore: deprecated_member_use
                    color: AppColors.kBlackColor.withOpacity(0.1),
                  ),
                  fillColor: AppColors.kFChipContainerColor1,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    borderSide: BorderSide(
                      color: AppColors.kFChipContainerColor1,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    borderSide: BorderSide(
                      color: AppColors.kFChipContainerColor2,
                      width: 3,
                    ),
                  ),
                ),
                onChanged: (String value) {
                  Provider.of<MindfulExerciseProvider>(
                    context,
                    listen: false,
                  ).searchMindfulExercise(value);
                },
              ),
              SizedBox(
                height: AppConstances.kSizedBoxValue,
              ),
              Consumer<MindfulExerciseProvider>(
                builder: (context, mindfulExercises, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: mindfulExercises.mindfulExercises.length,
                    itemBuilder: (context, index) {
                      MindfulExerciseModel mindfulExercise =
                          mindfulExercises.mindfulExercises[index];

                      return Container(
                        padding: EdgeInsets.all(
                          AppConstances.kPaddingValue,
                        ),
                        margin: EdgeInsets.only(
                          bottom: AppConstances.kPaddingValue,
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
                                blurRadius: 3,
                                offset: Offset(1, 1))
                          ],
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                            child: Image.asset(
                              mindfulExercise.imagePath,
                              width: MediaQuery.of(context).size.width * 0.13,
                              height: MediaQuery.of(context).size.height * 0.6,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            mindfulExercise.name,
                            style: AppTextStyle.kTitleStyle,
                          ),
                          subtitle: Text(
                            mindfulExercise.description,
                            style: AppTextStyle.kSmallDescriptionStyle,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
