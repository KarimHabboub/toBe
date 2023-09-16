import 'package:flutter/material.dart';

import '../../../../widget/my_card_item.dart';

class MyCurriculumPage extends StatelessWidget {
  const MyCurriculumPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => const MyCardItem(),
          separatorBuilder: (context, index) => const SizedBox(
            height: 15,
          ),
          itemCount: 3,
        ),
      ],
    );
  }
}