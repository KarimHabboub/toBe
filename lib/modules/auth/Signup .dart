import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tobe/utils/styles.dart';
import '../../utils/colors.dart';
import '../../utils/components.dart';
import '../../widget/authentication_methods.dart';
import '../../widget/my_title.dart';
import '../../controllers/auth_controller.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final AuthController cont = Get.find();

  @override
  Widget build(BuildContext context) {
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
                    text1: 'Create account ✌ ',
                    text2: 'Create your account to start your course lessons.'),
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
                    GetX<AuthController>(builder: (cont)=> MyTextFormField(
                      textControl: email,
                      keyboardType: TextInputType.emailAddress,
                      prefix: Icons.email_outlined,
                      onSubmit: (v) {
                        cont.signupChangIsSelected1(text: v);
                      },
                      onChange: (v) {
                        cont.signupChangIsSelected1(text: v);
                      },
                      colorIcon: cont.signupIsSelected1.value
                          ? myTealColor
                          : myLightTealColor,
                      validator: (value) {return null;},
                    ),),
                    const SizedBox(height: 15),
                    GetX<AuthController>(builder: (cont)=> MyTextFormField(
                      textControl: password,
                      keyboardType: TextInputType.visiblePassword,
                      prefix: Icons.lock,
                      suffix: cont.signupSuffixIcon.value,
                      suffixPressed: (){
                        cont.changSignupObscureText();
                      },
                      obscureText: cont.signupObscureText.value,

                      onSubmit: (v) {
                        cont.signupChangIsSelected2(text: v);
                      },
                      onChange: (v) {
                        cont.signupChangIsSelected2(text: v);

                      },
                      colorIcon: cont.signupIsSelected2.value
                          ? myTealColor
                          : myLightTealColor,
                      validator: (value) {return null;},
                    ),),
                    const SizedBox(height: 30),
                    GetX<AuthController>(builder: (cont) => MyButton(
                        text: 'Sign up',
                        onPressed: () {},
                        color: cont.signupIsSelected1.value &&
                            cont.signupIsSelected2.value
                            ? myTealColor
                            : myGreyColor
                    ),),
                    const SizedBox(height: 15),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'By continuing, you agree to our ',
                        style: Styles.textDarkGreyStyle14,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Terms & Conditions',

                            style: TextStyle(
                              color: myTealColor,
                            ), // قم بتغيير لون هذه الكلمة
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                                color: myTealColor), // قم بتغيير لون هذه الكلمة
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                    TextButton(
                      onPressed: () {
                        Get.offNamed("/login");
                      },
                      child: const Text(
                        "I already have an account",
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
