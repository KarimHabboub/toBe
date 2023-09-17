import 'package:flutter/material.dart';
import '../../../../controllers/home_controller.dart';
import '../../../../widget/my_intrinsic_container.dart';

class MyPopularSearchItems extends StatelessWidget {
  const MyPopularSearchItems({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int index = 0;
        index < homeController.popularSearch.length;
        index += (homeController.popularSearch.length / 2).round())
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: IntrinsicWidth(
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  for (int i = index;
                  i <
                      index +
                          (homeController.popularSearch.length / 2)
                              .round() &&
                      i < homeController.popularSearch.length;
                  i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20),
                          child: MyIntrinsicContainer(
                              text: homeController.popularSearch[i]),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )
      ],
    );
  }
}