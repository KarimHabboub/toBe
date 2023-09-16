import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final Rx<PageController> pageController = PageController().obs;
  
  void changeToC(){
    pageController.value.previousPage(duration: Duration(
      milliseconds: 500,
    ),
      curve: Curves.fastLinearToSlowEaseIn,

    );
  }
  void changeToR(){
    pageController.value.nextPage(duration: Duration(
      milliseconds: 500,
    ),
      curve: Curves.fastLinearToSlowEaseIn,

    );
  }
  
  RxInt indexPageView = 0.obs;

  final List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  RxString dropdownValue ="".obs;

  void changeDropDownValue({required String? value}){
    dropdownValue.value = value ?? list.first ;


  }

}