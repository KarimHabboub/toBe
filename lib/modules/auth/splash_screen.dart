import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tobe/modules/auth/auth_controller.dart';


class SplashScreen extends StatefulWidget {
   SplashScreen({Key? key}) : super(key: key);

  final x = Get.put(AuthController() , permanent: true);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(('/onBoarding'));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return const Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage("assets/auth/Group 34.png"),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ],
      ),
    );
  }
}