import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tobe/controllers/auth_controller.dart';

import '../../utils/colors.dart';
import '../../utils/components.dart';
import '../../utils/styles.dart';
import '../../widget/authentication_methods.dart';
import '../../widget/my_title.dart';
import '../../widget/my_container_icon.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final AuthController cont = Get.find();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * .0122;
    return Scaffold(
      backgroundColor: myBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 100, left: 20, right: 20, bottom: 50),
            child: Column(
              children: [
                const MyTitle(
                  text1: 'Welcome back 👋 ',
                  text2: 'Login to your account to continue your course.',
                ),
                const SizedBox(height: 50),
                const AuthenticationMethods(),
                const SizedBox(height: 50),
                const Text(
                  'Or sign up with your email',
                  style: Styles.textDarkGreyStyle14,
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    GetX<AuthController>(
                      builder: (cont) => MyTextFormField(
                        textControl: email,
                        keyboardType: TextInputType.emailAddress,
                        prefix: Icons.email_outlined,
                        onSubmit: (v) {
                          cont.loginChangIsSelected1(text: v);
                        },
                        onChange: (v) {
                          cont.loginChangIsSelected1(text: v);
                        },
                        colorIcon: cont.loginIsSelected1.value
                            ? myTealColor
                            : myLightTealColor,
                        validator: (value) {},
                      ),
                    ),
                    const SizedBox(height: 15),
                    GetX<AuthController>(
                      builder: (cont) => MyTextFormField(
                        textControl: password,
                        keyboardType: TextInputType.visiblePassword,
                        prefix: Icons.lock,
                        suffix: cont.loginSuffixIcon.value,
                        suffixPressed: () {
                          cont.changLoginObscureText();
                        },
                        obscureText: cont.loginObscureText.value,
                        onSubmit: (v) {
                          cont.loginChangIsSelected2(text: v);
                        },
                        onChange: (v) {
                          cont.loginChangIsSelected2(text: v);
                        },
                        colorIcon: cont.loginIsSelected2.value
                            ? myTealColor
                            : myLightTealColor,
                        validator: (value) {},
                      ),
                    ),
                    const SizedBox(height: 30),
                    GetX<AuthController>(builder: (cont) => MyButton(
                        text: 'Login',
                        onPressed: () {

                        },
                        color: (cont.loginIsSelected1.value &&
                            cont.loginIsSelected2.value)
                            ? myTealColor
                            : myGreyColor),),
                    const SizedBox(height: 15),
                    const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot password?',
                          style: Styles.textDarkGreyStyle14,
                        )),
                    const SizedBox(height: 100),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/signup');
                      },
                      child: const Text(
                        "I don't have an account yet",
                        style: TextStyle(
                          fontSize: 14,
                          color: myTealColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
