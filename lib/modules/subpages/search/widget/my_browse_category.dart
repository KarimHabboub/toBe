import 'package:flutter/material.dart';

import '../../../../controllers/auth_controller.dart';
import '../../../../utils/styles.dart';

class MyBrowseCategory extends StatelessWidget {
  const MyBrowseCategory({
    super.key,
    required this.cont,
  });

  final AuthController cont;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15.0, vertical: 10),
              child: Row(
                children: [
                  Text(
                    "${cont.myEmoji[index].code}   ${cont.myEmoji[index].name}",
                    style: Styles.textStyle16,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  )
                ],
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: cont.myEmoji.length),
      ),
    );
  }
}