import 'my_course_listview_item.dart';
import 'package:flutter/material.dart';

class MyCourseListView extends StatelessWidget {
  const MyCourseListView({
    required this.height,
    required this.width,
    super.key,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => MyCourseListViewItem(
                height: height,
                width: width,
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemCount: 10),
    );
  }
}
