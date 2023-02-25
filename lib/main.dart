import 'dart:io';

import 'package:clockingapp/provider/clocking_provider.dart';
import 'package:clockingapp/provider/login_user_provider.dart';
import 'package:clockingapp/provider/signup_provider.dart';
import 'package:flutter/material.dart';
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
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future main() async{

  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter(initialization);
  if (Platform.isIOS) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "your api key Found in GoogleService-info.plist",
            appId: "Your app id found in Firebase",
            messagingSenderId: "Your Sender id found in Firebase",
            projectId: "Your Project id found in Firebase"));
  } else {
    await Firebase.initializeApp();
  }
  bool  showHome = false;
  bool showDashboard = false;
  final firebaseUser = await FirebaseAuth.instance.currentUser;
  final firstTime = await LocalStorageUtils.readBool('isFirstTime') ??  false;

  if(firebaseUser != null){
    showDashboard =  true;
  }

  if(firstTime && firebaseUser == null){
    showHome =  true;
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginUserProvider()),
        ChangeNotifierProvider(create: (_) => SignUpUserProvider()),
        ChangeNotifierProvider(create: (_) => ForgetPasswordProvider()),
        ChangeNotifierProvider(create: (_) => ClockingProvider()),
      ],
      child: MyApp(showHome: showHome, showDashboard : showDashboard),
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
            '/': (context) => showDashboard ? const DashBoardPage()  : showHome ? const LoginPage() : OnboardingPage(),
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

