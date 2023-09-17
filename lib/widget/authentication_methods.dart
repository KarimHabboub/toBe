import 'package:flutter/material.dart';

import 'my_container_icon.dart';

class AuthenticationMethods extends StatelessWidget {
  const AuthenticationMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 90,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              'assets/auth/google-logo-9808.png',
            ),
          ),
        ),
        const MyContainerIcon(
          child: Icon(
            Icons.facebook,
            color: Colors.blue,
            size: 45,
          ),
          width: 90,
        ),
        const MyContainerIcon(
          child: Icon(
            Icons.apple,
            color: Colors.black,
            size: 45,
          ),
          width: 90,
        ),
      ],
    );
  }
}