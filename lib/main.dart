import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_stack/presentation/core/router.dart';
import 'package:story_stack/presentation/core/style/colors.dart';
import 'package:story_stack/presentation/home/screen/home_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
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
      initialRoute: AppRouter.launchScreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
