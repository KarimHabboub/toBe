import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MyIconWithNotification extends StatelessWidget {
  const MyIconWithNotification({
    required this.icon,
    super.key, this.backgroundColorCircleAvatar,
  });

  final Widget icon;
  final Color? backgroundColorCircleAvatar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: icon),
         Align(
          alignment: Alignment.topRight,
          child: CircleAvatar(
              backgroundColor: backgroundColorCircleAvatar ?? myDarkTealColor,
              radius: 7,
              child: const Icon(
                Icons.fiber_manual_record,
                color: Colors.red,
                size: 12,
              )),
        ),
      ],
    );
  }
}