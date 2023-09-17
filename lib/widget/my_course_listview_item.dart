import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'my_container_icon.dart';

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
              child:  Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyContainerIcon(
                      child: Text('⭐ 4.8'),
                      height: 50,
                      width: 80,
                    ),
                    Spacer(),
                    MyContainerIcon(
                      child: Text(
                        '❤',
                        style: TextStyle(),
                      ),
                      height: 50,
                      width: 50,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Design Thingking Fundamental",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: myGreyColor,
                  size: 20,
                ),
                Text("Robert Fox"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "\$150",
                  style: TextStyle(
                    color: myTealColor,
                  ),
                ),
                Spacer(),
                Container(
                  height: 30,

                  decoration: BoxDecoration(
                      color: myLightRedColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        'Best seller',
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
        ),
      ),
    );
  }
}