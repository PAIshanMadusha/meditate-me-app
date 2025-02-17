import 'package:flutter/material.dart';
import 'package:meditate_me_app/models/sleep_exercise_model.dart';
import 'package:meditate_me_app/providers/custom_data_provider.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_constances.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';
import 'package:meditate_me_app/widgets/reusable/custom_text_input_feild.dart';
import 'package:provider/provider.dart';

class SleepForm extends StatefulWidget {
  const SleepForm({super.key});

  @override
  State<SleepForm> createState() => _SleepFormState();
}

class _SleepFormState extends State<SleepForm> {
  final _formKey = GlobalKey<FormState>();

  String _category = "";
  String _name = "";
  String _description = "";
  int _duration = 0;
  String _audioUrl = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Create a New Sleep Exercise",
                  style: AppTextStyle.kTitleStyle.copyWith(
                    color: AppColors.kGreyColor,
                  ),
                ),
                SizedBox(
                  height: AppConstances.kSizedBoxValue,
                ),
                CustomTextInputFeild(
                  labelText: "Category",
                  hintText: "Category",
                  keyBoardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter a Category";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _category = newValue!;
                  },
                ),
                SizedBox(
                  height: AppConstances.kSizedBoxValue,
                ),
                CustomTextInputFeild(
                  labelText: "Name",
                  hintText: "Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter a Name";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _name = newValue!;
                  },
                  keyBoardType: TextInputType.text,
                ),
                SizedBox(
                  height: AppConstances.kSizedBoxValue,
                ),
                CustomTextInputFeild(
                  labelText: "Description",
                  hintText: "Description",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter a Description";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _description = newValue!;
                  },
                  keyBoardType: TextInputType.text,
                ),
                SizedBox(
                  height: AppConstances.kSizedBoxValue,
                ),
                CustomTextInputFeild(
                  labelText: "Duration",
                  hintText: "Duration",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter a Duration";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _duration = int.parse(newValue!);
                  },
                  keyBoardType: TextInputType.number,
                ),
                SizedBox(
                  height: AppConstances.kSizedBoxValue,
                ),
                CustomTextInputFeild(
                  labelText: "AudioURL",
                  hintText: "AudioURL",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a AudioURL";
                    }
                    return null;
                  },
                  keyBoardType: TextInputType.text,
                  onSaved: (newValue) {
                    _audioUrl = newValue!;
                  },
                ),
                SizedBox(
                  height: AppConstances.kSizedBoxValue,
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        AppColors.kBlueColor,
                      ),
                      shadowColor: WidgetStatePropertyAll(
                        AppColors.kMindfulCardColor1,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        final sleepExercise = SleepExerciseModel(
                          category: _category,
                          name: _name,
                          description: _description,
                          duration: _duration,
                          audioUrl: _audioUrl,
                        );

                        //Clear the Fields
                        _formKey.currentState!.reset();
                        _category = "";
                        _name = "";
                        _description = "";
                        _duration = 0;
                        _audioUrl = "";

                        Provider.of<CustomDataProvider>(context, listen: false)
                            .addSleepExercise(sleepExercise, context);
                      }
                    },
                    child: Text(
                      "Submit",
                      style: AppTextStyle.kBodyStyle.copyWith(
                        color: AppColors.kWhiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
