import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:notapp/main.dart';

class Localcontroller extends GetxController {
  Locale? initlang = sharedpref!.getString("lang") == null
      ? Get.deviceLocale
      : Locale(sharedpref!.getString("lang")!);

  void changelang(String codelang) {
    Locale locale = Locale(codelang);
    sharedpref?.setString("lang", codelang);
    Get.updateLocale(locale);
  }
}
