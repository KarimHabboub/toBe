import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/styles.dart';
import '../../../../widget/my_container_icon.dart';

class MyReviewPage extends StatelessWidget {
  const MyReviewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Student reviews",
            style: Styles.textStyle16,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "⭐⭐⭐⭐⭐  4.8 out of 5",
            style: Styles.textStyle12,
          ),
          const SizedBox(
            height: 35,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        const MyReviewListViewItem(),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemCount: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyReviewListViewItem extends StatelessWidget {
  const MyReviewListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 80,
              // set the width as per your requirements
              height: 80,
              // set the height as per your requirements
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://img.freepik.com/free-photo/college-girls-studying-together_23-2149038414.jpg?w=996&t=st=1694687325~exp=1694687925~hmac=f98141d93397028b3bb4d725b598ddba09bf1754fb3805146fa7b47bc18ddb12'),
                  fit: BoxFit.cover,
                ),
              ),
              // You can also add other properties to the Container as needed, like padding, margin, alignment, etc.
            ),
            const SizedBox(
              width: 20,
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reviewer Username',
                    style: Styles.textStyle16,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '1 day ago',
                    style: Styles.textStyle12,
                  ),
                ],
              ),
            ),
            const MyContainerIcon(
              child: Text('⭐ 4.8'),
              backgroundColor: myBackgroundColor,
              height: 50,
              width: 80,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Description this is a simple description that explain the description about the class or blabla bla and then blablabla of course.",
          style: Styles.textDarkGreyStyle14,
        ),
      ],
    );
  }
}
