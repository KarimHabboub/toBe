import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/styles.dart';

class MySubtitle extends StatelessWidget {
  const MySubtitle({
    super.key,
    required this.text1,
    required this.text2,
    this.categoryName,
  });

  final String text1;
  final String text2;
  final String? categoryName;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          text1,
          style: Styles.textStyle18,
        ),
        const SizedBox(width: 10,),
        if(categoryName != null)
        Container(
          height: 30,

          decoration: BoxDecoration(
              color: myLightTeal2Color,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                categoryName!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  color: myTealColor,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        Text(
          text2,
          style: Styles.textTealStyle14,
        ),
      ],
    );
  }
}