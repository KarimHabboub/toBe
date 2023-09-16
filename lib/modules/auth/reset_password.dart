import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tobe/controllers/auth_controller.dart';
import 'package:tobe/utils/components.dart';

import '../../utils/colors.dart';
import '../../widget/my_app_bar.dart';
import '../../widget/my_title.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const MyAppBar(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                ),
                text: 'Reset password'),
            const SizedBox(height: 50),
            const MyTitle(
              text1: 'Reset your password 🔐',
              text2:
                  'Enter your email and a verification code to reset the password will be sent to your email.',
            ),
            const SizedBox(height: 50),
           GetX<AuthController>(builder: (cont) =>  MyTextFormField(
             textControl: email,
             keyboardType: TextInputType.emailAddress,
             prefix: Icons.email_outlined,
             onSubmit: (v) {
               cont.resetPasswordChangIsSelected(text: v);
             },
             onChange: (v) {
               cont.resetPasswordChangIsSelected(text: v);
             },
             colorIcon: cont.resetPasswordIsSelected.value
                 ? myTealColor
                 : myLightTealColor,
             validator: (value) {},
           ),),
            const SizedBox(height: 30),
            GetX<AuthController>(builder: (cont) =>  MyButton(
                text: 'Send verification code',
                onPressed: () {},
                color: cont.resetPasswordIsSelected.value ? myTealColor :myGreyColor),),
          ],
        ),
      ),
    );
  }
}
