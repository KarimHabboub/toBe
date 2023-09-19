import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/components.dart';
import '../../../../widget/myI_icon_with_notification.dart';
import '../../../../widget/my_container_icon.dart';
import '../../../../widget/my_title.dart';
import 'my_empty_cart_body.dart';
import 'my_filled_cart_body.dart';

class MyHeadExploreScreen extends StatelessWidget {
  const MyHeadExploreScreen({
    super.key,
    required this.searchText,
  });

  final TextEditingController searchText;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Row(
                children: [
                  const MyTitle(
                    text1: 'Hi, Karim  👋',
                    text2: 'Let\'s start learning!',
                    textColor: Colors.white,
                  ),
                  const Spacer(),
                  MyContainerIcon(
                    backgroundColor: myDarkTealColor,
                    child: const MyIconWithNotification(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    onClick: () {
                      buildShowModalBottomSheet(
                          context,
                           const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (false) MyEmptyCart(),
                              if (true) MyFilledCart()
                            ],
                          ));
                    },
                  ),
                  const MyContainerIcon(
                    backgroundColor: myDarkTealColor,
                    child: MyIconWithNotification(
                      icon: Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              MyTextFormField(
                textControl: searchText,
                keyboardType: TextInputType.text,
                prefix: Icons.search,
                hintText: 'Search for anything',
                validator: (value) {
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
