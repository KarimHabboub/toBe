import 'package:flutter/material.dart';

import '../utils/styles.dart';
import 'my_container_icon.dart';


class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.icon,
    required this.text,
    this.width,
  });

  final Widget? icon;
  final String text;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyContainerIcon(
          icon: icon,
          width: width,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .73,
          child: Text(text,
              style: Styles.textStyle16,
              textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

AppBar myAppBar(
    {required BuildContext context, required String title, num width = 1.5}) {
  return AppBar(
    automaticallyImplyLeading: false,
    shadowColor: Colors.grey,
    title: Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 21,
            color: Colors.black,
          ), // أيقونة مخصصة للـ "pop"
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / width,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Styles.textStyle16,
          ),
        ),
      ],
    ),
  );
}
