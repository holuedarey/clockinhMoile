import 'dart:io';

import 'package:sng/provider/clocking_provider.dart';
import 'package:sng/provider/create_profile_provider.dart';
import 'package:sng/provider/location_provider.dart';
import 'package:sng/provider/login_user_provider.dart';
import 'package:sng/provider/reset_password_provider.dart';
import 'package:sng/provider/signup_provider.dart';
import 'package:sng/provider/terms_provider.dart';
import 'package:sng/provider/user_clocking_provider.dart';
import 'package:flutter/material.dart';
import 'Data/models/user.dart';
import 'Helper/storage_keys.dart';
import 'Util/storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Util/constant.dart';
import 'Views/dashboard/dashboard_page.dart';
import 'Views/onboarding/forget_password.dart';
import 'Views/onboarding/login_page.dart';
import 'Views/onboarding/onboarding_page.dart';
import 'Views/onboarding/signup_page.dart';
import 'provider/forget_password_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter(initialization);

  bool showHome = false;
  bool showDashboard = false;
  final userData = await LocalStorageUtils.readObject<UserModel>(StorageKeys.userObject);
  final firstTime = await LocalStorageUtils.readBool('isFirstTime') ?? false;
  if (userData != null) {
    showDashboard = true;
  }

  if (firstTime && userData == null) {
    showHome = true;
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginUserProvider()),
        ChangeNotifierProvider(create: (_) => SignUpUserProvider()),
        ChangeNotifierProvider(create: (_) => ForgetPasswordProvider()),
        ChangeNotifierProvider(create: (_) => ClockingProvider()),
        ChangeNotifierProvider(create: (_) => UserClockingProvider()),
        ChangeNotifierProvider(create: (_) => ResetUserProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => TermsProvider()),
        ChangeNotifierProvider(create: (_) => SetUpProfileProvider()),
      ],
      child: MyApp(showHome: showHome, showDashboard: showDashboard),
    ),
  );
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 0));
}

class MyApp extends StatelessWidget {
  final bool showDashboard;
  final bool showHome;

  const MyApp({super.key, required this.showDashboard, required this.showHome});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // You can use the library anywhere in the app even in theme
          theme: kThemeData,
          routes: {
            '/': (context) => showDashboard
                ? const DashBoardPage()
                : showHome
                    ? const LoginPage()
                    : OnboardingPage(),
            '/login': (context) => const LoginPage(),
            '/register': (context) => const SignUpPage(),
            '/forget_password': (context) => const ForgetPasswordPage(),
            '/dashboard': (context) => const DashBoardPage(),
          },
        );
      },
    );
  }
}
