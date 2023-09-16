import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/components.dart';
import '../../utils/styles.dart';
import '../../widget/my_app_bar.dart';
import '../../widget/my_title.dart';
import '../../controllers/auth_controller.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({Key? key}) : super(key: key);

  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  final TextEditingController num3Controller = TextEditingController();
  final TextEditingController num4Controller = TextEditingController();

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
                text: 'Verify',
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 25,
                ),
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
                            text1: "Recovery code 📲",
                            text2:
                                "Check your inbox, we have send the Verification code to your email."),
                        const SizedBox(height: 50),
                        Row(
                          children: [
                            Expanded(
                              child: MyTextFormField(
                                textControl: num1Controller,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "يجب تعبئة هذا الحقل  ";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: MyTextFormField(
                                textControl: num2Controller,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "يجب تعبئة هذا الحقل  ";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: MyTextFormField(
                                textControl: num3Controller,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "يجب تعبئة هذا الحقل  ";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: MyTextFormField(
                                textControl: num4Controller,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "يجب تعبئة هذا الحقل  ";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: MyTextFormField(
                                textControl: num4Controller,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "يجب تعبئة هذا الحقل  ";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 39),
                        GetX<AuthController>(
                          builder: (cont) => MyButton(
                              text: 'Verify',
                              onPressed: () {},
                              color: cont.verifyComplete()
                                  ? myTealColor
                                  : myGreyColor),
                        ),
                        const SizedBox(height: 39),
                        TextButton(
                          onPressed: () {},
                          child: RichText(
                            text: TextSpan(
                              text: 'Not retrieve any code? ',
                              style: Styles.textStyle14,
                              children: [
                                TextSpan(
                                  text: 'Resend code',
                                  style: Styles.textStyle14
                                      .copyWith(color: myTealColor),
                                ),
                              ],
                            ),
                          ),
                        ),
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
