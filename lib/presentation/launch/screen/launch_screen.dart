import 'package:flutter/material.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1C29),
      body: SafeArea(
        child: Center(
          child: Image.asset('assets/images/app_logo.png'),
        ),
      ),
    );
  }
}
