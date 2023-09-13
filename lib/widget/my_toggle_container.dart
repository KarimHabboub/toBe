import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/styles.dart';

class MyToggleContainer extends StatelessWidget {
  const MyToggleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: myLightGreyColor,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          const SizedBox(width: 7,),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: myTealColor,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: const Center(
                child: Text(
                  'Curriculum',
                  style: Styles.textWhiteStyle14,
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: const Center(
                child: Text(
                  'Review',
                  style: Styles.textStyle14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 7,),

        ],
      ),
    );
  }
}