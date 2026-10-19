import 'package:flutter/material.dart';
import 'package:story_stack/presentation/style/colors.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Image.asset('assets/images/app_logo.png'),
        ),
      ),
    );
  }
}
