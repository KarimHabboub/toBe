import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tobe/modules/auth/auth_controller.dart';
import 'package:tobe/utils/styles.dart';

import '../../utils/colors.dart';
import '../../utils/components.dart';

class BoardingModel {
  Widget widget;
  String title;
  String body;

  BoardingModel({
    required this.widget,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final boardController = PageController();
  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: SmoothPageIndicator(
                      controller: boardController,
                      count: controller.boarding.length,
                      effect: WormEffect(
                        dotWidth: MediaQuery.of(context).size.width * .3,
                        activeDotColor: myTealColor,
                        dotColor: myLightTealColor,
                        dotHeight: 3,
                        spacing: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .6,
              child: PageView.builder(
                itemBuilder: (context, index) =>
                    onBoardingItemBuilder(controller.boarding[index]),
                itemCount: controller.boarding.length,
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (index) {

                },
              ),
            ),
            MyButton(
              onPressed: () {
                Get.offNamed("/signup");
              },
              color: myTealColor,
              text: "Let’s get started",
            ),
            const SizedBox(height: 20),
            MyOutlinedButton(
                text: 'I already have an account',
                onPressed: () {
                  Get.offNamed("/login");
                },
                color: myTealColor)
          ],
        ),
      ),
    );
  }

  Widget onBoardingItemBuilder(BoardingModel model) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          model.widget,
          Column(
            children: [
              Text(
                model.title,
                style: Styles.textStyle24,
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(model.body,
                    textAlign: TextAlign.center, style: Styles.textStyle14),
              ),
            ],
          )
        ],
      );
}

class MyCont extends StatelessWidget {
  const MyCont({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      height: MediaQuery.of(context).size.height * .25,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
