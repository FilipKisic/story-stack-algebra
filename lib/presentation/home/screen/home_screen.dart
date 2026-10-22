import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:story_stack/presentation/asks/screen/ask_list_screen.dart';
import 'package:story_stack/presentation/core/style/colors.dart';
import 'package:story_stack/presentation/jobs/screen/job_list_screen.dart';
import 'package:story_stack/presentation/shows/screen/show_list_screen.dart';
import 'package:story_stack/presentation/stories/list/screen/story_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final _screens = [
    StoryListScreen(),
    AskListScreen(),
    ShowListScreen(),
    JobListScreen(),
  ];

  void selectIndex(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.backgroundColor,
        currentIndex: _selectedIndex,
        onTap: selectIndex,
        items: [
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedNews),
            label: 'Story',
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedBubbleChatQuestion),
            label: 'Ask',
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedChatPreview01),
            label: 'Show',
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedBriefcaseBusiness),
            label: 'Job',
          ),
        ],
      ),
    );
  }
}
