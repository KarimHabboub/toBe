import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/components.dart';
import '../../utils/styles.dart';
import '../../widget/my_app_bar.dart';
import '../../widget/my_title.dart';
import 'auth_controller.dart';

class NewPassword extends StatelessWidget {
  NewPassword({Key? key}) : super(key: key);

  final TextEditingController newPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const MyAppBar(
                text: 'New password',
                icon: Icon(Icons.arrow_back_ios_new ,size: 25,),
                width: 60,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        const MyTitle(
                            text1: "Set new password 🔐",
                            text2:
                                "Enter your email and a verification code to reset the password will be sent to your email."),
                        const SizedBox(height: 50),
                        GetX<AuthController>(
                          builder: (cont) => MyTextFormField(
                            textControl: newPassword,
                            keyboardType: TextInputType.visiblePassword,
                            prefix: Icons.lock,
                            suffix: cont.loginSuffixIcon.value,
                            suffixPressed: () {
                              cont.changLoginObscureText();
                            },
                            obscureText: cont.loginObscureText.value,
                            onSubmit: (v) {
                              cont.newPasswordChangIsSelected(text: v);
                            },
                            onChange: (v) {
                              cont.newPasswordChangIsSelected(text: v);
                            },
                            colorIcon: cont.newPasswordIsSelected.value
                                ? myTealColor
                                : myLightTealColor,
                            validator: (value) {},
                          ),
                        ),
                        const SizedBox(height: 39),
                        GetX<AuthController>(
                          builder: (cont) => MyButton(
                              text: 'Verify',
                              onPressed: () {},
                              color: cont.newPasswordIsSelected.value
                                  ? myTealColor
                                  : myLightTealColor,),
                        ),
                        const SizedBox(height: 39),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
