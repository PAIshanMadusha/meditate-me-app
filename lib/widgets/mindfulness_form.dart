import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_constances.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';
import 'package:meditate_me_app/widgets/reusable/custom_text_input_feild.dart';

class MindfulnessForm extends StatefulWidget {
  const MindfulnessForm({super.key});

  @override
  State<MindfulnessForm> createState() => _MindfulnessFormState();
}

class _MindfulnessFormState extends State<MindfulnessForm> {
  final _formKey = GlobalKey<FormState>();

  String _cateogry = "";
  String _name = "";
  String _description = "";
  List<String> _instructions = [];
  int _duration = 0;
  String _instructionsUrl = "";
  File? _imagePath;

  final ImagePicker _imagePicker = ImagePicker();

  //Method to Pick a Image
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imagePath = File(pickedFile.path);
      } else {
        return;
      }
    });
  }

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
                  "Create a New Mindful Exercise",
                  style: AppTextStyle.kTitleStyle.copyWith(
                    color: AppColors.kGreyColor,
                  ),
                ),
                SizedBox(
                  height: AppConstances.kSizedBoxValue,
                ),
                if (_imagePath != null)
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      child: Image.file(
                        _imagePath!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.kMindfulCardColor1,
                        ),
                        side: WidgetStatePropertyAll(
                          BorderSide(
                            color: AppColors.kMindfulCardColor2,
                            width: 1,
                          ),
                        ),
                      ),
                      onPressed: () => _pickImage(
                        ImageSource.camera,
                      ),
                      child: Text(
                        "Take a Photo",
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
                          AppColors.kMindfulCardColor1,
                        ),
                        side: WidgetStatePropertyAll(
                          BorderSide(
                            color: AppColors.kMindfulCardColor2,
                            width: 1,
                          ),
                        ),
                      ),
                      onPressed: () => _pickImage(
                        ImageSource.gallery,
                      ),
                      child: Text(
                        "Select a Photo",
                        style: AppTextStyle.kBodyStyle.copyWith(
                          color: AppColors.kWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppConstances.kSizedBoxValue,
                ),
                CustomTextInputFeild(
                  labelText: "Category",
                  hintText: "Category",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter a Category";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _cateogry = newValue!;
                  },
                  keyBoardType: TextInputType.text,
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
                  labelText: "Instructions",
                  hintText: "Instructions",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Instructions";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _instructions = newValue!.split(',');
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
                  labelText: "InstructionsURL",
                  hintText: "InstructionsURL",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter a InstrctionsURL";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _instructionsUrl = newValue!;
                  },
                  keyBoardType: TextInputType.text,
                ),
                SizedBox(
                  height: AppConstances.kSizedBoxValue,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      AppColors.kBlueColor,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: AppTextStyle.kBodyStyle.copyWith(
                      color: AppColors.kWhiteColor,
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
