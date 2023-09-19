import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/components.dart';
import '../../../../utils/styles.dart';
import '../../../../widget/my_container_icon.dart';

class MyEmptyCart extends StatelessWidget {
  const MyEmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9565,
      width: double.infinity,
      child: Column(
        children: [
           SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: MyContainerIcon(
                    onClick: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.25,
                      color: Colors.amberAccent,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.094,
                    ),
                    const Text(
                      "Nothing here yet  💁‍♂️",
                      textAlign: TextAlign.center,
                      style: Styles.textStyle16,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "You haven't added anything to your cart yet, start exploring your favorite courses!",
                      textAlign: TextAlign.center,
                      style: Styles.textDarkGreyStyle14,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    MyButton(
                        text: "Explore course",
                        onPressed: () {},
                        color: myTealColor)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
