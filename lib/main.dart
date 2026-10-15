import 'package:flutter/material.dart';
import 'package:story_stack/presentation/launch/screen/launch_screen.dart';
import 'package:story_stack/presentation/stories/list/screen/story_list_screen.dart';

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
      theme: ThemeData(fontFamily: 'Doto'),
      home: StoryListScreen(),
    );
  }
}
