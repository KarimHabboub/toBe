import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/styles.dart';
import 'my_video_data.dart';

class CourseDetailPart1 extends StatelessWidget {
  const CourseDetailPart1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        const Text(
          "Design Thinking Fundamental",
          style: Styles.textStyle20,
        ),
        const SizedBox(
          height: 15,
        ),
        const Row(
          children: [
            Icon(
              Icons.person,
              color: myTealColor,
              size: 20,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text('Halo Academy',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textTealStyle16),
            ),
            Text('⭐ 4.8'),
            SizedBox(
              width: 50,
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        const Text(
          "Description this is a simple description that explain the description about the class or blabla bla and then blablabla of course.",
          style: Styles.textDarkGreyStyle14,
        ),
        const SizedBox(
          height: 25,
        ),
        MyVideoData(
          title1: "Students",
          subTitle1: "143.247",
          title2: "Language",
          subTitle2: "English",
          width: width,
        ),
        const SizedBox(
          height: 17,
        ),
        MyVideoData(
          title1: "Last update",
          subTitle1: "Feb 2, 2021",
          title2: "Subtitle",
          subTitle2: "English and ",
          subTitle3: '5 more',
          width: width,
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}