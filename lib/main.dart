// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapsense/utils/app_colors.dart';
import 'package:snapsense/view-model/prompt_viewmodel.dart';
import 'package:snapsense/view/home_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PromptViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Generator',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: AppColor.themeColor
      ),
      home: PromptScreen(),
    );
  }
}
