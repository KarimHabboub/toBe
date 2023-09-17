import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tobe/utils/styles.dart';
import 'package:tobe/widget/my_container_icon.dart';

class HomeController extends GetxController {
  RxInt indexPageView = 0.obs;
  final List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  RxString dropdownValue = "".obs;

  //search
List<String> popularSearch = ['Cooking','Python',"Exel","Coding","Webflow",'UX Design'];

  void changeDropDownValue({required String? value}) {
    dropdownValue.value = value ?? list.first;
  }
}
