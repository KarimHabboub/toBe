import 'package:flutter/material.dart';

import '../utils/styles.dart';

class MyIntrinsicContainer extends StatelessWidget {
  const MyIntrinsicContainer({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(text,style: Styles.textStyle14,),
      ),
    );
  }
}