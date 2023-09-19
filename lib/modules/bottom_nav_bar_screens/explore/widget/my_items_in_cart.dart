import 'package:flutter/material.dart';
import '../../../../utils/styles.dart';
import '../../../../widget/my_course_data.dart';

class MyItemsInCart extends StatelessWidget {
  const MyItemsInCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(width: 20),
            const Icon(Icons.disc_full_sharp),
            const SizedBox(width: 20),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.tealAccent,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Remove",
                    style: Styles.textRedStyle12,
                  ),

                ),
              ],
            ),
            const SizedBox(width: 20),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyCourseData(
                    nameCourse:"Design Thingking Fundam kz" ,
                    nameAuth:"Robert Fox" ,
                    praCourse: 72,
                    stateCourse: "Popular",
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Move to wishlist",
                      style: Styles.textTealStyle12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
