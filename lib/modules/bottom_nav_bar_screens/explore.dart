import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tobe/utils/colors.dart';
import 'package:tobe/utils/components.dart';
import 'package:tobe/widget/my_container_icon.dart';
import '../../widget/myI_icon_with_notification.dart';
import '../../widget/my_course_listView.dart';
import '../../widget/my_show_categories.dart';
import '../../widget/my_subtitle.dart';
import '../../widget/my_title.dart';
import '../../controllers/auth_controller.dart';

class Explore extends StatelessWidget {
  Explore({Key? key}) : super(key: key);

  final TextEditingController searchText = TextEditingController();
  final cont = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                  color: myTealColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          MyTitle(
                            text1: 'Hi, Karim  👋',
                            text2: 'Let\'s start learning!',
                            textColor: Colors.white,
                          ),
                          Spacer(),
                          MyContainerIcon(
                            backgroundColor: myDarkTealColor,
                            child: MyIconWithNotification(
                                icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 30,
                            )),
                          ),
                          MyContainerIcon(
                            backgroundColor: myDarkTealColor,
                            child: MyIconWithNotification(
                                icon: Icon(
                              Icons.notifications,
                              size: 30,
                              color: Colors.white,
                            )),
                          ),
                        ],
                      ),
                      const Spacer(),
                      MyTextFormField(
                        textControl: searchText,
                        keyboardType: TextInputType.text,
                        prefix: Icons.search,
                        hintText: 'Search for anything',
                        validator: (value) {return null;},
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                  MyShowCategories(length: cont.myEmoji.length,cont: cont),
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
