import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tobe/modules/auth/on_boarding_screen.dart';
import 'package:tobe/modules/auth/splash_screen.dart';

import 'modules/auth/Signup .dart';
import 'modules/auth/choose_topic.dart';
import 'modules/auth/loagin.dart';
import 'modules/auth/new_password.dart';
import 'modules/auth/reset_password.dart';
import 'modules/auth/verify_screen.dart';
import 'modules/bottom_nav_bar_screens/explore.dart';
import 'modules/subpages/course_detail/course_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // خلفية شريط الحالة على الأندرويد
      statusBarIconBrightness: Brightness.light,
      // الأيقونات الموجودة في شريط الحالة على الأندرويد
      statusBarBrightness:
      Brightness.light, // الأيقونات الموجودة في شريط الحالة على الآيفون
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,

      ),
      initialRoute: "/courseDetail",
      getPages: [
        GetPage(name: '/' , page: ()=>  SplashScreen()),
        GetPage(name: '/onBoarding' , page: ()=>  OnBoardingScreen()),
        GetPage(name: '/login' , page: ()=>  Login()),
        GetPage(name: '/signup' , page: ()=>  SignUp()),
        GetPage(name: '/resetPassword' , page: ()=>  ResetPassword()),
        GetPage(name: '/verify' , page: ()=>  VerifyScreen()),
        GetPage(name: '/newPassword' , page: ()=>  NewPassword()),
        GetPage(name: '/chooseTopic' , page: ()=>  ChooseTopic()),
        GetPage(name: '/explore' , page: ()=>   Explore()),
        GetPage(name: '/courseDetail' , page: ()=>   CourseDetail()),
      ],
    );
  }
}
