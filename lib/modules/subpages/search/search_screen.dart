import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tobe/controllers/auth_controller.dart';
import 'package:tobe/controllers/home_controller.dart';
import 'package:tobe/modules/subpages/search/widget/my_browse_category.dart';
import 'package:tobe/modules/subpages/search/widget/my_popular_search_items.dart';
import 'package:tobe/utils/colors.dart';
import 'package:tobe/utils/components.dart';
import 'package:tobe/utils/styles.dart';
import 'package:tobe/widget/my_course_listview_item.dart';


class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final cont = Get.put(AuthController());
  final homeController = Get.put(HomeController());
  final searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: myBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: SizedBox(
          height: (height),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                MyTextFormField(
                    textControl: searchText,
                    keyboardType: TextInputType.text,
                    prefix: Icons.search,
                    hintText: "Search for anything",
                    suffix: Icons.mic,
                    validator: (value) {
                      return null;
                    }),
                const SizedBox(
                  height: 30,
                ),
                //MyFirstBodySearchScreen(homeController: homeController, cont: cont),
                const MySecondBodySearchScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MySecondBodySearchScreen extends StatelessWidget {
  const MySecondBodySearchScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;
    double aspectRatioPortrait = screenWidth / (screenHeight * .74);
    double aspectRatioLandscape = screenWidth / (screenHeight * 1.6);

    return Column(
      children: [
        const Text('Showing search result for “UX Design”',style: Styles.textDarkGreyStyle14,),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: MyOutlinedButton(
                onPressed: (){},
                color: myTealColor,
                child: Row(
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.tune,color: myTealColor,),
                      ),
                      const SizedBox(width: 10,),
                      const Text("Filter",style: Styles.textTealStyle16,),
                    ]
                ),
              ),
            ),
            const SizedBox(width: 20,),
            Expanded(
              child: MyOutlinedButton(
                onPressed: (){},
                color: myTealColor,
                child: Row(
                    children: [
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.tune,color: myTealColor,),
                      ),
                      const SizedBox(width: 10,),
                      const Text("Filter",style: Styles.textTealStyle16,),
                    ]
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        GridView.builder(
          itemCount: 9,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 10,
            childAspectRatio: orientation == Orientation.portrait ? aspectRatioPortrait : aspectRatioLandscape
          ),
          itemBuilder: (BuildContext context, int index) {
            return const GridTile(
              child: MyCourseListViewItem(height: 150, width: 200),
            );
          },
        ),
      ],
    );
  }
}

class MyFirstBodySearchScreen extends StatelessWidget {
  const MyFirstBodySearchScreen({
    super.key,
    required this.homeController,
    required this.cont,
  });

  final HomeController homeController;
  final AuthController cont;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Popular search',
          style: Styles.textStyle18,
        ),
        const SizedBox(
          height: 15,
        ),
        MyPopularSearchItems(homeController: homeController),
        const Text(
          'Browse category',
          style: Styles.textStyle18,
        ),
        const SizedBox(
          height: 25,
        ),
        MyBrowseCategory(cont: cont),
      ],
    );
  }
}




