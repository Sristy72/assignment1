import 'package:assignment1/screens/splash_screen1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF9F9F9),  // your background color
      ),
      debugShowCheckedModeBanner: false,
      title: 'Intricate',
      home: Splash1(),
    );
  }
}
