import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditate_me_app/pages/main_pages/create_custom_exercise_page.dart';
import 'package:meditate_me_app/pages/main_pages/custom_exercises_page.dart';
import 'package:meditate_me_app/pages/main_pages/home_page.dart';
import 'package:meditate_me_app/pages/main_pages/mindful_exercises_page.dart';
import 'package:meditate_me_app/pages/main_pages/profile_page.dart';
import 'package:meditate_me_app/utils/app_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //BottomNavigationBar OnTap:
  int _selectedIndex = 3;

  static const List<Widget> _pages = [
    HomePage(),
    MindfulExercisesPage(),
    CreateCustomExercisePage(),
    CustomExercisePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  //BottomNavigationBar OnTap:

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/house.svg",
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 0
                      ? AppColors.kBlueColor
                      : AppColors.kGreyColor,
                  BlendMode.srcIn,
                ),
                semanticsLabel: "Home svg",
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/shield-plus.svg",
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 1
                      ? AppColors.kBlueColor
                      : AppColors.kGreyColor,
                  BlendMode.srcIn,
                ),
                semanticsLabel: "Meditation svg",
              ),
              label: "Meditation",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/square-plus.svg",
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 2
                      ? AppColors.kBlueColor
                      : AppColors.kGreyColor,
                  BlendMode.srcIn,
                ),
                semanticsLabel: "Add svg",
              ),
              label: "Add",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/files.svg",
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 3
                      ? AppColors.kBlueColor
                      : AppColors.kGreyColor,
                  BlendMode.srcIn,
                ),
                semanticsLabel: "Custom svg",
              ),
              label: "Custom",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/circle-user.svg",
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 4
                      ? AppColors.kBlueColor
                      : AppColors.kGreyColor,
                  BlendMode.srcIn,
                ),
                semanticsLabel: "",
              ),
              label: "Profile",
            ),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
