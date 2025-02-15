import 'package:flutter/material.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_constances.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';
import 'package:meditate_me_app/widgets/meditation_form.dart';
import 'package:meditate_me_app/widgets/sleep_form.dart';

class CreateCustomExercisePage extends StatefulWidget {
  const CreateCustomExercisePage({super.key});

  @override
  State<CreateCustomExercisePage> createState() =>
      _CreateCustomExercisePageState();
}

class _CreateCustomExercisePageState extends State<CreateCustomExercisePage> {
  String typeOfContent = "Meditation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Custom Exercises",
          style: AppTextStyle.kMainTitleStyle.copyWith(
            fontSize: 22,
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
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstances.kPaddingValue,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.kMindfulCardColor2,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  gradient: AppColors.kMindfulCardColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kMindfulCardColor2,
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: Offset(1, 1),
                    )
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: typeOfContent,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      // ignore: deprecated_member_use
                      color: AppColors.kBlackColor.withOpacity(0.6),
                    ),
                    isExpanded: true,
                    items: ["Meditation", "Mindfulness", "Sleep"].map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: AppTextStyle.kTitleStyle.copyWith(
                            // ignore: deprecated_member_use
                            color: AppColors.kBlackColor.withOpacity(0.6),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(
                        () {
                          typeOfContent = value!;
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: AppConstances.kSizedBoxValue * 2,
              ),
              MeditationForm(),
              SleepForm(),
            ],
          ),
        ),
      ),
    );
  }
}
