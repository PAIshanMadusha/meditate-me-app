import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meditate_me_app/models/sleep_exercise_model.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_constances.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';

class SleepExerciseTimerPage extends StatefulWidget {
  final SleepExerciseModel sleepExerciseModel;
  const SleepExerciseTimerPage({
    super.key,
    required this.sleepExerciseModel,
  });

  @override
  State<SleepExerciseTimerPage> createState() => _SleepExerciseTimerPageState();
}

class _SleepExerciseTimerPageState extends State<SleepExerciseTimerPage> {
  Timer? _timer;
  int _remaningTime = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _remaningTime = widget.sleepExerciseModel.duration * 60;
  }

  //Method to Start the Timer
  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remaningTime > 0) {
          _remaningTime--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  //Method to Pause the Timmer
  void _pauseTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _isRunning = false;
    }
  }

  //Method to Stop the Timer
  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _remaningTime = widget.sleepExerciseModel.duration * 60;
      _isRunning = false;
    });
  }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remaningSeconds = seconds % 60;

    return "$minutes:${remaningSeconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.sleepExerciseModel.name,
          style: AppTextStyle.kMainTitleStyle.copyWith(
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
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  gradient: AppColors.kSleepCardColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kSleepCardColor2,
                      blurRadius: 1,
                      spreadRadius: 2,
                      offset: Offset(1, 1),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppConstances.kPaddingValue,
                  ),
                  child: Column(
                    children: [
                      Text(
                        widget.sleepExerciseModel.category,
                        style: AppTextStyle.kTitleStyle.copyWith(
                          color: AppColors.kGreyColor,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: AppConstances.kSizedBoxValue,
                      ),
                      Text(
                        widget.sleepExerciseModel.name,
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
                        "Duration: ${widget.sleepExerciseModel.duration.toString()} Min",
                        style: AppTextStyle.kMainTitleStyle.copyWith(
                          color: AppColors.kWhiteColor,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: AppConstances.kSizedBoxValue,
                      ),
                      Text(
                        widget.sleepExerciseModel.description,
                        style: AppTextStyle.kSmallDescriptionStyle,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: AppConstances.kSizedBoxValue * 2,
                      ),
                      Center(
                        child: Text(
                          _formatTime(
                            _remaningTime,
                          ),
                          style: AppTextStyle.kMainTitleStyle.copyWith(
                            color: AppColors.kWhiteColor,
                            fontSize: 40,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppConstances.kPaddingValue,
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
                            onPressed: () {
                              setState(
                                () {
                                  _isRunning ? _pauseTimer() : _startTimer();
                                },
                              );
                            },
                            child: Text(
                              _isRunning
                                  ? "Pause"
                                  : (_remaningTime <
                                          widget.sleepExerciseModel.duration *
                                              60
                                      ? "Resume"
                                      : "Start"),
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
                                AppColors.kGreyColor,
                              ),
                            ),
                            onPressed: _stopTimer,
                            child: Text(
                              "Stop",
                              style: AppTextStyle.kBodyStyle.copyWith(
                                color: AppColors.kWhiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
