import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';

class MyToggleContainer extends StatelessWidget {
  const MyToggleContainer({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: myLightGreyColor, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          const SizedBox(
            width: 7,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                controller.indexPageView.value = 0;
                print(controller.indexPageView.value);
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: controller.indexPageView.value == 0 ? myTealColor : null,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'Curriculum',
                    style: controller.indexPageView.value == 0
                        ? Styles.textWhiteStyle14
                        : Styles.textStyle14,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                controller.indexPageView.value = 1;
                print(controller.indexPageView.value);
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: controller.indexPageView.value == 1 ? myTealColor : null,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    'Review',
                    style: controller.indexPageView.value == 1
                        ? Styles.textWhiteStyle14
                        : Styles.textStyle14,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 7,
          ),
        ],
      ),
    );
  }
}
