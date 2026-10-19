import 'package:flutter/material.dart';
import 'package:story_stack/presentation/home/screen/home_screen.dart';
import 'package:story_stack/presentation/style/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Doto',
        canvasColor: AppColors.backgroundColor,
      ),
      home: HomeScreen(),
    );
  }
}
