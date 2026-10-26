import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:story_stack/di.dart';
import 'package:story_stack/domain/entity/story.dart';
import 'package:story_stack/presentation/core/style/colors.dart';
import 'package:story_stack/presentation/core/style/text_styles.dart';
import 'package:story_stack/presentation/stories/list/controller/state/story_list_state.dart';
import 'package:story_stack/utils.dart';

class StoryListScreen extends ConsumerWidget {
  const StoryListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(storyListControllerProvider);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: switch (state) {
            LoadingState() => LoadingStateWidget(),
            EmptyState() => EmptyStateWidget(),
            LoadedState(stories: final storyList) => LoadedStateWidget(storyList),
            ErrorState() => ErrorStateWidget(),
          },
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

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/empty_state.png'),
          Text(
            'No results',
            style: AppTextStyles.emptyStateTitleTextStyle,
          ),
          Text(
            'There are no stories yet.\nReturn later.',
            style: AppTextStyles.emptyStateSubtitleTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/error_state.png'),
          const SizedBox(height: 20),
          Text(
            'There was an error',
            style: AppTextStyles.emptyStateTitleTextStyle,
          ),
          Text(
            'Something happened on the backend.\nPlease try again later.',
            style: AppTextStyles.emptyStateSubtitleTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class LoadedStateWidget extends StatelessWidget {
  final List<Story> storyList;
  const LoadedStateWidget(this.storyList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Story Stack',
          style: AppTextStyles.titleTextStyle,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: storyList.length,
            itemBuilder: (context, index) => StoryCard(story: storyList[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
          ),
        ),
      ],
    );
  }
}

class StoryCard extends StatelessWidget {
  final Story story;
  const StoryCard({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          story.by,
          style: AppTextStyles.cardSubtitleTextStyle,
        ),
        Text(
          story.title,
          style: AppTextStyles.cardTitleTextStyle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            HugeIcon(icon: HugeIcons.strokeRoundedCalendar02, color: AppColors.accentColor, size: 22),
            const SizedBox(width: 5),
            Text(
              story.time.toDateTimeFormat(),
              style: AppTextStyles.cardStatsTextStyle,
            ),
            const SizedBox(width: 20),

            HugeIcon(icon: HugeIcons.strokeRoundedComment01, color: AppColors.accentColor, size: 22),
            const SizedBox(width: 5),
            Text(
              story.kids.length.toString(),
              style: AppTextStyles.cardStatsTextStyle,
            ),
            const SizedBox(width: 20),

            HugeIcon(icon: HugeIcons.strokeRoundedThumbsUp, color: AppColors.accentColor, size: 22),
            const SizedBox(width: 5),
            Text(
              story.score.toString(),
              style: AppTextStyles.cardStatsTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
