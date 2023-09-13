import 'package:flutter/material.dart';

import '../utils/styles.dart';



class MyTitle extends StatelessWidget {
  const MyTitle({Key? key, required this.text1, required this.text2, this.textColor})
      : super(key: key);

  final String text1;
  final String text2;
  final Color? textColor;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.normal, color: textColor?? const Color(0xFF1D2D3A)),
          ),
          const SizedBox(height: 12),
          Text(
            text2,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.normal, color:textColor?? const Color(0xFF66696A)),
          ),
        ],
      ),
    );
  }
}
