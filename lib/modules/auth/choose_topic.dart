import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:get/get.dart';
import 'package:tobe/utils/components.dart';
import 'package:tobe/widget/my_container_icon.dart';
import '../../utils/colors.dart';
import '../../utils/styles.dart';
import '../../controllers/auth_controller.dart';

class ChooseTopic extends StatelessWidget {
  ChooseTopic({Key? key}) : super(key: key);


  final cont = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Pick your favorite topic ",
                      textAlign: TextAlign.center,
                      style: Styles.textStyle24,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Choose your favorite topic to help us deliver the most suitable course for you.",
                      textAlign: TextAlign.center,
                      style: Styles.textDarkGreyStyle14,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                MyGridView(emoji: cont.myEmoji),
                GetX<AuthController>(
                  builder: (cont) =>MyButton(
                    text: 'Start your journey',
                    onPressed: () {
                      if (cont.numMyTopic >= 3) {}
                    },
                    color: (cont.numMyTopic >= 3) ? myTealColor : myGreyColor,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'You can still change your topic again later',
                  style: Styles.textStyle14,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  MyGridView({
    super.key,
    required this.emoji,
  });

  final List<Emoji> emoji;

  final cont = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .47,
      child: GridView.builder(
        itemCount: 9,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: Center(
              child: GetX<AuthController>(
                init: AuthController(),
                builder: (cont) => MyTopicItem(
                  emoji: emoji[index],
                  isSelected: cont.isSelectedList[index].value,
                  // تمرير حالة التحديد لكل عنصر
                  onSelect: () {
                    // تحديث حالة التحديد للعنصر المحدد
                    cont.chooseTopic(
                      index: index,
                      nameTopic: emoji[index].name,
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyTopicItem extends StatelessWidget {
  const MyTopicItem({
    super.key,
    required this.emoji,
    required this.isSelected,
    required this.onSelect,
  });

  final Emoji emoji;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            onSelect();
          },
          child: MyContainerIcon(
            isSelected: isSelected,
            height: 70,
            width: 80,
            child: Text(emoji.code),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          emoji.name,
          style: Styles.textDarkGreyStyle14,
        ),
      ],
    );
  }
}
