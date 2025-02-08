import 'package:flutter/material.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_constances.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(
              AppConstances.kPaddingValue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                      child: Image.asset(
                        "assets/images/treelogo.jpg",
                        width: MediaQuery.of(context).size.width * 0.26,
                      ),
                    ),
                    SizedBox(
                      width: AppConstances.kSizedBoxValue,
                    ),
                    Text(
                      "MeditateMe",
                      style: AppTextStyle.mainTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: AppConstances.kSizedBoxValue,
                ),
                Text(
                  "Select a Category to Start Exploring",
                  style: AppTextStyle.titleStyle,
                ),
                SizedBox(
                  height: AppConstances.kSizedBoxValue,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      // ignore: deprecated_member_use
                      color: AppColors.kFChipContainerColor2.withOpacity(0.2),
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    gradient: AppColors.kFChipContainerColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: AppConstances.kPaddingValue,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FilterChip(
                            label: Text(
                              "All",
                            ),
                            onSelected: (value) {},
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FilterChip(
                            label: Text(
                              "Mindfulness",
                            ),
                            onSelected: (value) {},
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FilterChip(
                            label: Text(
                              "Meditation",
                            ),
                            onSelected: (value) {},
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          FilterChip(
                            label: Text(
                              "Sleep Stories",
                            ),
                            onSelected: (value) {},
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
