import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:story_stack/presentation/style/colors.dart';
import 'package:story_stack/presentation/style/text_styles.dart';

class StoryListScreen extends StatelessWidget {
  const StoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Story stack',
                style: AppTextStyles.titleTextStyle,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (context, index) => const SizedBox(height: 15),
                  itemBuilder: (context, index) => StoryCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
        backgroundColor: AppColors.accentColor,
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          '@author',
          style: AppTextStyles.cardSubtitleTextStyle,
        ),
        Text(
          'Story title containing some text ;)',
          style: AppTextStyles.cardTitleTextStyle,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            HugeIcon(icon: HugeIcons.strokeRoundedCalendar02, color: AppColors.accentColor, size: 22),
            const SizedBox(width: 5),
            Text(
              '19 Oct 2026',
              style: AppTextStyles.cardStatsTextStyle,
            ),
            const SizedBox(width: 20),

            HugeIcon(icon: HugeIcons.strokeRoundedComment01, color: AppColors.accentColor, size: 22),
            const SizedBox(width: 5),
            Text(
              '69',
              style: AppTextStyles.cardStatsTextStyle,
            ),
            const SizedBox(width: 20),

            HugeIcon(icon: HugeIcons.strokeRoundedThumbsUp, color: AppColors.accentColor, size: 22),
            const SizedBox(width: 5),
            Text(
              '113',
              style: AppTextStyles.cardStatsTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
