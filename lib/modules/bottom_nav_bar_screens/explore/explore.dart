import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tobe/modules/bottom_nav_bar_screens/explore/widget/my_head_explore_screen.dart';
import 'package:tobe/utils/colors.dart';
import '../../../widget/my_course_listView.dart';
import '../../../widget/my_show_categories.dart';
import '../../../widget/my_subtitle.dart';
import '../../../controllers/auth_controller.dart';

class Explore extends StatelessWidget {
  Explore({Key? key}) : super(key: key);

  final TextEditingController searchText = TextEditingController();
  final cont = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height * 0.09);
    return Scaffold(
      backgroundColor: myBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyHeadExploreScreen(searchText: searchText),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MySubtitle(text1: 'Popular course', text2: 'See all'),
                  const SizedBox(
                    height: 25,
                  ),
                  const MyCourseListView(height: 200, width: 250),
                  const SizedBox(
                    height: 25,
                  ),
                  const MySubtitle(text1: 'Categories', text2: 'See all'),
                  const SizedBox(
                    height: 20,
                  ),
                  MyShowCategories(length: cont.myEmoji.length, cont: cont),
                  const SizedBox(
                    height: 25,
                  ),
                  const MySubtitle(
                      text1: 'Your topic',
                      text2: 'See all',
                      categoryName: 'Design'),
                  const SizedBox(
                    height: 20,
                  ),
                  const MyCourseListView(height: 150, width: 200),
                  const SizedBox(
                    height: 25,
                  ),
                  const MySubtitle(
                      text1: 'Your topic',
                      text2: 'See all',
                      categoryName: 'Design'),
                  const SizedBox(
                    height: 20,
                  ),
                  const MyCourseListView(height: 150, width: 200),
                  const SizedBox(
                    height: 25,
                  ),
                  const MySubtitle(
                      text1: 'Your topic',
                      text2: 'See all',
                      categoryName: 'Design'),
                  const SizedBox(
                    height: 20,
                  ),
                  const MyCourseListView(height: 150, width: 200),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


