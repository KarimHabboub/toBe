import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/components.dart';
import '../utils/styles.dart';

class MyEnrollCourse extends StatelessWidget {
  const MyEnrollCourse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            // ظل من الجزء العلوي فقط
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 4,
            offset: const Offset(0, -2), // تحديد الانتقال للأعلى
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  'Price',
                  style: Styles.textDarkGreyStyle16,
                ),
                Spacer(),
                Text(
                  '\$150',
                  style: Styles.textTealStyle24,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            MyButton(
                text: 'Enroll course now',
                onPressed: () {},
                color: myTealColor),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: MyOutlinedButton(
                        text: "Add to cart",
                        onPressed: () {},
                        color: myTealColor)),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: MyOutlinedButton(
                        text: "Add to cart",
                        onPressed: () {},
                        color: myTealColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
