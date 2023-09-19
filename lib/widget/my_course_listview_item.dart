import 'package:flutter/material.dart';
import 'my_container_icon.dart';
import 'my_course_data.dart';

class MyCourseListViewItem extends StatelessWidget {
  const MyCourseListViewItem({
    required this.height,
    required this.width,
    super.key,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: InkWell(
        onTap: (){

        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://img.freepik.com/premium-photo/young-millennials-elegant-beige-trenchcoats-pullovers-pants-using-mobile-gadgets-outdoors-while-sitting-against-evergreen-trees_274679-22955.jpg?w=996'),
                  fit: BoxFit.cover,
                ),
              ),
              child:  const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyContainerIcon(
                      height: 50,
                      width: 80,
                      child: Text('⭐ 4.8'),
                    ),
                    Spacer(),
                    MyContainerIcon(
                      height: 50,
                      width: 50,
                      child: Text(
                        '❤',
                        style: TextStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const MyCourseData(
              nameCourse: "Design Thingking Fundamental",
              nameAuth: "Robert Fox",
              praCourse: 150,
              stateCourse: 'Best seller',
            )

          ],
        ),
      ),
    );
  }
}

