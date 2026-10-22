import 'package:flutter/material.dart';
import 'package:story_stack/presentation/home/screen/home_screen.dart';
import 'package:story_stack/presentation/launch/screen/launch_screen.dart';
import 'package:story_stack/presentation/stories/details/screen/story_details_screen.dart';

class AppRouter {
  static const String launchScreen = '/';
  static const String homeScreen = '/home';
  static const String storyDetailsScreen = '/storyDetails';

  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case launchScreen:
        return MaterialPageRoute(builder: (_) => const LaunchScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case storyDetailsScreen:
        return MaterialPageRoute(builder: (_) => const StoryDetailsScreen());
      default:
        throw Exception('Route not found: ${settings.name}');
    }
  }
}