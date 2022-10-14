import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/helper/dependencies.dart';
import 'package:portfolio/view/pages/home_page.dart';
import 'package:portfolio/view/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  //key: v0lEIODQNXeAIZlyl-W2vFhNOXmtZaqxOzieJHH8bBw
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: ControllerBinding(),
      home: HomeView(),
    );
  }
}
