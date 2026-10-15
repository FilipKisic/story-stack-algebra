import 'package:story_stack/domain/entity/story.dart';

sealed class StoryListState {}

class LoadingState extends StoryListState{}

class EmptyState extends StoryListState {}

class LoadedState extends StoryListState {
  final List<Story> stories;

  LoadedState(this.stories);
}

class ErrorState extends StoryListState {
  final String message;

  ErrorState(this.message);
}