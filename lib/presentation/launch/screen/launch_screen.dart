import 'package:flutter/material.dart';
import 'package:story_stack/presentation/core/router.dart';
import 'package:story_stack/presentation/core/style/colors.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    redirectToHomeScreen(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Image.asset('assets/images/app_logo.png'),
        ),
      ),
    );
  }

  void redirectToHomeScreen(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    Navigator.of(context).pushNamed(AppRouter.homeScreen);
  }
}
