import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notapp/addnotes.dart';
import 'package:notapp/local/local.dart';
import 'package:notapp/local/localcontroller.dart';
import 'package:notapp/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedpref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedpref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Localcontroller controller = Get.put(Localcontroller());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Notes",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Cairo',
      ),
      translations: Mylocal(),
      locale: controller.initlang,
      home: SplashScreen(),
      routes: {"addnotes": (context) => const AddNotes()},
    );
  }
}
