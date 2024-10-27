import 'package:flutter/material.dart';
import 'package:snapsense/utils/app_colors.dart';

import 'view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor.themeColor,
        fontFamily: "Poppins",
      ),
      home: const HomeView(),
    );
  }
}
// create image of dog
