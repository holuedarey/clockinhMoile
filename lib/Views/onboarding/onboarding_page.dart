import 'package:clockingapp/Views/onboarding/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Controllers/onboarding_controller.dart';
import '../../Util/constant.dart';
import '../../component/header_logo.dart';
import '../../component/ph_button.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();

  OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<dynamic> navigateSignUp() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var pushReplacement = Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignUpPage()),
      );
      if (prefs.getBool('isFirstTime') == null) {
        await prefs.setBool('isFirstTime', true);
        pushReplacement;
      } else {
        pushReplacement;
      }
    }

    return SafeArea(
      child: Scaffold(
          body: Stack(
            alignment: Alignment.center,
            // textDirection: TextDirection.rtl,
            // fit: StackFit.loose,
            // clipBehavior: Clip.hardEdge,
        children: [
          PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.onboardingPages.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const HeaderLogo(),
                    SizedBox(height: kExtraFullPadding),
                    Image.asset(
                      _controller.onboardingPages[index].imageAsset,
                      width: 250,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(_controller.onboardingPages[index].title,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: primaryColor,
                                  )),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                          _controller.onboardingPages[index].description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey)),
                    )
                  ],
                );
              }),
          Positioned(
            bottom: kFullPaddingOnboardingIndicator,
            left: kMediumPadding,
            child: SmoothPageIndicator(
                controller: _controller.pageController, // PageController
                count: _controller.onboardingPages.length,
                effect: const ExpandingDotsEffect(
                    activeDotColor: kPrimaryColor,
                    dotHeight: 8.0,
                    dotWidth: 10.0), // your preferred effect
                onDotClicked: (index) => _controller.slideToPage(index)),
          ),
           Positioned(
              right: kExtraMediumPadding,
              bottom: kFullPadding,
              child: SizedBox(
                  height: 45,
                  width: 150,
                  child: PhButton(
                    buttonName: 'Sign Up',
                    buttonCallBack: navigateSignUp,
                    buttonColor: primaryColor,
                    buttonRadius: 12.0,
                    buttonHeight: 50.0,
                  )))
        ],
      )),
    );
  }
}
