import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:story_stack/di.dart';
import 'package:story_stack/domain/entity/story.dart';
import 'package:story_stack/presentation/core/style/colors.dart';
import 'package:story_stack/presentation/core/style/text_styles.dart';
import 'package:story_stack/presentation/stories/details/controller/state/comment_list_state.dart';
import 'package:story_stack/presentation/stories/details/widget/primary_action_button.dart';
import 'package:story_stack/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryDetailsScreen extends ConsumerWidget {
  final Story story;

  const StoryDetailsScreen({super.key, required this.story});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commentListControllerProvider);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(story.title, style: AppTextStyles.cardTitleTextStyle),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text('Author: ', style: AppTextStyles.detailsTextStyle),
                  Text(story.by, style: AppTextStyles.detailsAuthorTextStyle),
                  Spacer(),

                  HugeIcon(
                    icon: HugeIcons.strokeRoundedCalendar02,
                    color: AppColors.accentColor,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    story.time.toDateTimeFormat(),
                    style: AppTextStyles.detailsTextStyle,
                  ),

                  const SizedBox(width: 20),

                  HugeIcon(
                    icon: HugeIcons.strokeRoundedThumbsUp,
                    color: AppColors.accentColor,
                  ),
                  const SizedBox(width: 5),
                  Text(story.score.toString(), style: AppTextStyles.detailsTextStyle),
                ],
              ),
              const SizedBox(height: 10),
              Divider(),
              CommentList(state: state),
              Spacer(),
              if (story.url != null)
                PrimaryActionButton(
                  label: 'Open full story',
                  onPressed: () => _openInBrowser(story.url!),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _openInBrowser(String url) async {
    url = url.replaceAll('twitter', 'x');
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print("There was an error while opening: $url");
    }
  }
}

class CommentList extends StatelessWidget {
  final CommentListState state;

  const CommentList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: switch (state) {
        LoadingState() => Center(child: CircularProgressIndicator()),
        LoadingMoreState() => Center(child: Text('Loading more...')),
        EmptyState() => Center(child: Text('Empty...')),
        LoadedState(commentList: final comments) => ListView.separated(
          itemCount: comments.length,
          itemBuilder: (context, index) => Text(comments[index].author, style: AppTextStyles.cardTitleTextStyle),
          separatorBuilder: (_, _) => const SizedBox(height: 10),
        ),
        ErrorLoadingMoreState() => Center(child: Text('Error Loading more...')),
        ErrorState() => Center(child: Text('Error')),
      },
    );
  }
}
