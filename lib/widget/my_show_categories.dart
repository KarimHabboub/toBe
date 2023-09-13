import 'package:flutter/material.dart';

import '../modules/auth/auth_controller.dart';

class MyShowCategories extends StatelessWidget {
  const MyShowCategories({
    super.key,
    required this.cont,
  });

  final AuthController cont;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int index = 0;
        index < cont.myEmoji.length;
        index += (cont.myEmoji.length / 2).round())
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: IntrinsicWidth(
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  for (int i = index;
                  i <
                      index +
                          (cont.myEmoji.length / 2)
                              .round() &&
                      i < cont.myEmoji.length;
                  i++)
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 8.0, bottom: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20),
                          child: Text(
                            "${cont.myEmoji[i].code}  ${cont.myEmoji[i].name}",
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )
      ],
    );
  }
}
