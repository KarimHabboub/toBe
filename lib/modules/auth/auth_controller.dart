import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:get/get.dart';

import 'on_boarding_screen.dart';

class AuthController extends GetxController{







  //Login Screen


  //TextFormField login Screen
  RxBool loginIsSelected1 = false.obs;
  RxBool loginIsSelected2 = false.obs;
  RxBool loginObscureText = false.obs;
  Rx<IconData> loginSuffixIcon = Icons.remove_red_eye_outlined.obs;

  void loginChangIsSelected1({required String text }){
    if(text.isEmpty){
      loginIsSelected1.value = false;
    }else{
      loginIsSelected1.value = true;
    }
  }

  void loginChangIsSelected2({required String text }){
    if(text.isEmpty){
      loginIsSelected2.value = false;
    }else{
      loginIsSelected2.value = true;
    }
  }

  void changLoginObscureText(){
    loginObscureText.value = !loginObscureText.value;
    loginSuffixIcon.value = loginObscureText.value ?  Icons.visibility_off_outlined : Icons.remove_red_eye_outlined;
  }




// Signup Screen

  //TextFormFields signup Screen
  RxBool signupIsSelected1 = false.obs;
  RxBool signupIsSelected2 = false.obs;
  RxBool signupObscureText = false.obs;
  Rx<IconData> signupSuffixIcon = Icons.remove_red_eye_outlined.obs;

  void signupChangIsSelected1({required String text }){
    if(text.isEmpty){
      signupIsSelected1.value = false;
    }else{
      signupIsSelected1.value = true;
    }
  }

  void signupChangIsSelected2({required String text }){
    if(text.isEmpty){
      signupIsSelected2.value = false;
    }else{
      signupIsSelected2.value = true;
    }
  }

  void changSignupObscureText(){
    signupObscureText.value = !signupObscureText.value;
    signupSuffixIcon.value = signupObscureText.value ?  Icons.visibility_off_outlined : Icons.remove_red_eye_outlined;
  }





  // ResetPassword Screen
  RxBool resetPasswordIsSelected = false.obs;

  void resetPasswordChangIsSelected({required String text }){
    if(text.isEmpty){
      resetPasswordIsSelected.value = false;
    }else{
      resetPasswordIsSelected.value = true;
    }
  }





  // Verify Screen
  RxBool verifyIsSelected1 = false.obs;
  RxBool verifyIsSelected2 = false.obs;
  RxBool verifyIsSelected3 = false.obs;
  RxBool verifyIsSelected4 = false.obs;

  void verifyChangIsSelected1({required String text }){
    if(text.isEmpty){
      verifyIsSelected1.value = false;
    }else{
      verifyIsSelected1.value = true;
    }
  }

  void verifyChangIsSelected2({required String text }){
    if(text.isEmpty){
      verifyIsSelected2.value = false;
    }else{
      verifyIsSelected2.value = true;
    }
  }

  void verifyChangIsSelected3({required String text }){
    if(text.isEmpty){
      verifyIsSelected3.value = false;
    }else{
      verifyIsSelected3.value = true;
    }
  }

  void verifyChangIsSelected4({required String text }){
    if(text.isEmpty){
      verifyIsSelected4.value = false;
    }else{
      verifyIsSelected4.value = true;
    }
  }

  bool verifyComplete(){
    if(verifyIsSelected1.value && verifyIsSelected2.value && verifyIsSelected3.value && verifyIsSelected4.value){
      return true;
    }else{
      return false;
    }
  }


// NewPassword
  RxBool newPasswordIsSelected = false.obs;

  void newPasswordChangIsSelected({required String text }){
    if(text.isEmpty){
      newPasswordIsSelected.value = false;
    }else{
      newPasswordIsSelected.value = true;
    }
  }


  // ChooseTopic Screen
  final List<RxBool> isSelectedList = List.generate(9, (index) => false.obs);
  final RxList _myTopic = [].obs;
  final Emoji art = Emoji("Art", '🎨');
  final Emoji business = Emoji("Business", '💼');
  final Emoji food = Emoji("Food", '🍜');
  final Emoji coding = Emoji("Coding", '🖥️');
  final Emoji design = Emoji("Design", '🖋️');
  final Emoji gaming = Emoji("Gaming", '🎮');
  final Emoji marketing = Emoji("Marketing", '🤳');
  final Emoji music = Emoji("Music", '🎶');
  final Emoji sport = Emoji("Sport", '⚽');
  late  List<Emoji> _emoji = [];

  List<Emoji> get myEmoji{
     _emoji = [
      art,
      business,
      food,
      coding,
      design,
      gaming,
      marketing,
      music,
      sport
    ];
    return _emoji;
  }


  void chooseTopic({required int index , required String nameTopic}){
    isSelectedList[index].value = !isSelectedList[index].value;
    if( isSelectedList[index].value ){
      _myTopic.add(nameTopic);

    }else {
      _myTopic.remove(nameTopic);

    }
  }

  int get numMyTopic{
    return _myTopic.length;
  }










  //OnBoarding
  List<BoardingModel> boarding = [
    BoardingModel(
        widget: const MyCont(),
        title: 'Join and study together',
        body:
        'Find your best experience while studying and seeking knowledge in here'),
    BoardingModel(
        widget: const MyCont(),
        title: 'Explore new knowledge',
        body:
        'Find your best experience while studying and seeking knowledge in here'),
    BoardingModel(
        widget: const MyCont(),
        title: 'Find your mentors',
        body:
        'Find your best experience while studying and seeking knowledge in here'),
  ];

  RxBool isLast = false.obs;

  void onSubmit(context) {
    // CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
    //   if(value == true)
    //     goToScreenAndFinish(
    //       context,
    //       ShopLoginScreen(),
    //     );
    // });

    Get.offNamed("/login");
  }

}