import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import '../Data/models/onboarding_info.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;

  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  slideToPage(index) {
    selectedPageIndex.value = index;
    pageController.animateToPage(index,
        curve: Curves.decelerate, duration: const Duration(milliseconds: 300));

    print(selectedPageIndex);
  }


  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
        "assets/onboard_screen_1.png",
        "Get Notified in Real-time",
        "Teach your kids money management on how to earn, spend and save"),
    OnboardingInfo("assets/onboard_screen_2.png", "Manage location of your  of Attendance",
        "Fix daily spending limits,disable cards, approve withdrawal and monitor spending with alerts"),
    OnboardingInfo("assets/onboard_screen_3.png", "Check In or Out with Ease",
        "Feel safe and secure as you get an instant alert when your child arrives or leaves school."),
  ];
}
