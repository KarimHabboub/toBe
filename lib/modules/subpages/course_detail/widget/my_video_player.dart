import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../widget/myI_icon_with_notification.dart';
import '../../../../widget/my_container_icon.dart';

class MyVideoPlayer extends StatelessWidget {
  const MyVideoPlayer({
    super.key,
    required this.player,
  });

  final Widget player;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        player,
         const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              MyContainerIcon(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: Colors.white,
                ),
                backgroundColor: myGreyColor,
                width: 50,
                height: 50,
              ),
              Spacer(),
              MyContainerIcon(
                icon: MyIconWithNotification(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    backgroundColorCircleAvatar: myGreyColor),
                backgroundColor: myGreyColor,
                width: 55,
                height: 55,
              ),
            ],
          ),
        )
      ],
    );
  }
}
