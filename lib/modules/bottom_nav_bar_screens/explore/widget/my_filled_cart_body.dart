import 'package:flutter/material.dart';
import '../../../../utils/styles.dart';
import '../../../../widget/my_container_icon.dart';
import 'my_items_in_cart.dart';

class MyFilledCart extends StatelessWidget {
  const MyFilledCart({
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
                    onClick: () {
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
              child:  const Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your items",
                      style: Styles.textStyle18,
                    ),
                    SizedBox(height: 20),
                    MyItemsInCart()
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

