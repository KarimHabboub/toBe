import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MyCourseData extends StatelessWidget {
  const MyCourseData({
    super.key, required this.nameCourse, required this.nameAuth, required this.praCourse, required this.stateCourse,
  });
  final String nameCourse;
  final String nameAuth;
  final int praCourse;
  final String stateCourse;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameCourse,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Icon(
              Icons.person,
              color: myGreyColor,
              size: 20,
            ),
            const SizedBox(width: 10,),
            Text(nameAuth),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "\$$praCourse",
              style: const TextStyle(
                color: myTealColor,
              ),
            ),
            const Spacer(),
            Container(
              height: 30,

              decoration: BoxDecoration(
                  color: myLightRedColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    stateCourse,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: myRedColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}