import 'package:story_stack/domain/entity/story.dart';

sealed class StoryListState {}

class LoadingState extends StoryListState{}

class LoadingMoreState extends StoryListState {
  final List<Story> stories;

  LoadingMoreState(this.stories);
}

class EmptyState extends StoryListState {}

class LoadedState extends StoryListState {
  final List<Story> stories;
  int currentPage = 0;
  bool hasMore = false;

  LoadedState(this.stories, this.currentPage, this.hasMore);
}

class ErrorState extends StoryListState {
  final String message;

  ErrorState(this.message);
}

class ErrorLoadingMoreState extends StoryListState {
  final List<Story> stories;
  final String message;

  ErrorLoadingMoreState(this.stories, this.message);
}