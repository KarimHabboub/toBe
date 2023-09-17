import 'package:flutter/material.dart';
import 'package:tobe/utils/colors.dart';

class MyContainerIcon extends StatelessWidget {
  const MyContainerIcon({
    Key? key,
    this.child,
    this.width = 60,
    this.height = 60,
    this.backgroundColor = Colors.white,
    this.isSelected = false,


  }) : super(key: key);
  final Widget? child;
  final Color? backgroundColor;
  final bool isSelected;
  final double? width;
  final double? height;




  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: isSelected ? myTealColor : Colors.transparent, width: 2)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Center(child: child)
              ),
            ),
          ),
          if (isSelected)
            const Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                  backgroundColor: myBackgroundColor,
                  radius: 10,
                  child: Center(
                      child: Icon(
                    Icons.check_circle,
                    color: myTealColor,
                    size: 20,
                  ))),
            )
        ],
      ),
    );
  }
}
