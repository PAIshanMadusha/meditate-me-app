import 'package:flutter/material.dart';
import 'package:meditate_me_app/helpers/app_helper.dart';
import 'package:meditate_me_app/models/meditation_exercise_model.dart';
import 'package:meditate_me_app/models/mindful_exercise_model.dart';
import 'package:meditate_me_app/models/sleep_exercise_model.dart';
import 'package:meditate_me_app/providers/custom_data_provider.dart';
import 'package:meditate_me_app/services/user_service.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_constances.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final UserService _userService = UserService();
  String? savedName;

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final name = await _userService.loadUserName();
    setState(() {
      savedName = name ?? "";
      _nameController.text = savedName!;
    });
  }

  Future<void> _saveUserName() async {
    final newName = _nameController.text.trim();
    if (newName.isNotEmpty) {
      await _userService.saveUserName(newName);
      setState(() {
        savedName = newName;
      });
      if (mounted) {
        AppHelper.showSnackBar(context, "Name Saved Successsfully!");
      }
    } else {
      if (context.mounted) {
        AppHelper.showSnackBar(context, "Name Cannot be Empty!");
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: AppTextStyle.kMainTitleStyle.copyWith(),
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
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      // ignore: deprecated_member_use
                      color: AppColors.kBlueColor.withOpacity(0.6),
                      width: 3,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                    child: Image.asset(
                      "assets/images/me.jpg",
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppConstances.kSizedBoxValue,
              ),
              TextField(
                controller: _nameController,
                style: AppTextStyle.kTitleStyle.copyWith(
                  color: AppColors.kBlueColor,
                  fontSize: 22,
                  letterSpacing: 4,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: AppColors.kMindfulCardColor2,
                  filled: true,
                  labelText: "Your Name",
                  labelStyle: AppTextStyle.kSmallDescriptionStyle.copyWith(
                    color: AppColors.kBlueColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    borderSide: BorderSide(
                      color: AppColors.kMindfulCardColor1,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    borderSide: BorderSide(
                      color: AppColors.kMindfulCardColor1,
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppConstances.kSizedBoxValue,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.kMainTitleColor,
                  ),
                ),
                onPressed: _saveUserName,
                child: Text(
                  "Save Name",
                  style: AppTextStyle.kSmallDescriptionStyle.copyWith(
                    color: AppColors.kWhiteColor,
                  ),
                ),
              ),
              SizedBox(
                height: AppConstances.kSizedBoxValue,
              ),
              Text(
                "Here are Your Custom Exercises",
                style: AppTextStyle.kTitleStyle,
              ),
              SizedBox(
                height: AppConstances.kSizedBoxValue,
              ),
              Consumer<CustomDataProvider>(
                builder: (BuildContext context, data, child) {
                  return ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      _buildExerciseTitle("Meditations"),
                      _buildMeditationsList(
                        data.getMeditations(),
                      ),
                      SizedBox(
                        height: AppConstances.kSizedBoxValue,
                      ),
                      _buildExerciseTitle("Mindfulness Exercises"),
                      _buildMindfulExercisesList(
                        data.getMindfulExercises(),
                      ),
                      SizedBox(
                        height: AppConstances.kSizedBoxValue,
                      ),
                      _buildExerciseTitle("Sleep Exercises"),
                      _buildSleepExercisesList(
                        data.getSleepExercises(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //title
  Widget _buildExerciseTitle(String title) {
    return Text(
      title,
      style: AppTextStyle.kTitleStyle,
    );
  }

  //Card
  Widget _buildContentCard({
    required title,
    required description,
    required duration,
  }) {
    return Container(
      decoration: BoxDecoration(),
      child: ListTile(
        title: Text(title),
        subtitle: Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text("$duration Min"),
      ),
    );
  }

  //Exercises
  Widget _buildMeditationsList(List<MeditationExerciseModel> data) {
    if (data.isEmpty) {
      return Text("No Meditations are Created!");
    } else {
      return Column(
        children: data.map((meditation) {
          return _buildContentCard(
            title: meditation.name,
            description: meditation.description,
            duration: meditation.duration,
          );
        }).toList(),
      );
    }
  }

  Widget _buildMindfulExercisesList(List<MindfulExerciseModel> data) {
    if (data.isEmpty) {
      return Text("No Mindful Exercises are Created!");
    } else {
      return Column(
        children: data.map((mindful) {
          return _buildContentCard(
            title: mindful.name,
            description: mindful.description,
            duration: mindful.duration,
          );
        }).toList(),
      );
    }
  }

  Widget _buildSleepExercisesList(List<SleepExerciseModel> data) {
    if (data.isEmpty) {
      return Text("No Sleep Exercises are Created!");
    } else {
      return Column(
        children: data.map((sleep) {
          return _buildContentCard(
            title: sleep.name,
            description: sleep.description,
            duration: sleep.duration,
          );
        }).toList(),
      );
    }
  }
}
