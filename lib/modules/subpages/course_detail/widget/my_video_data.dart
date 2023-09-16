import 'package:flutter/material.dart';

import '../../../../utils/styles.dart';

class MyVideoData extends StatelessWidget {
  const MyVideoData({
    super.key,
    required this.width,
    required this.title1,
    required this.subTitle1,
    required this.title2,
    required this.subTitle2,
    this.subTitle3,
  });

  final double width;
  final String title1;
  final String subTitle1;
  final String title2;
  final String subTitle2;
  final String? subTitle3;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textDarkGreyStyle14,
              ),
              Text(
                subTitle1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle20,
              ),
            ],
          ),
        ),
        SizedBox(
          width: width / 220,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title2,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textDarkGreyStyle14,
              ),
              RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: subTitle2,
                      style: Styles.textStyle20,
                    ),
                    if (subTitle3 != null)
                      TextSpan(
                        text: subTitle3,
                        style: Styles.textTealStyle20,
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}