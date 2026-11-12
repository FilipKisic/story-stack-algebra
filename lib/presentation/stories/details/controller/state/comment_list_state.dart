import 'package:story_stack/domain/entity/comment.dart';

sealed class CommentListState {}

class LoadingState extends CommentListState {}

class LoadingMoreState extends CommentListState {
  final List<Comment> commentList;

  LoadingMoreState(this.commentList);
}

class EmptyState extends CommentListState {}

class LoadedState extends CommentListState {
  final List<Comment> commentList;

  LoadedState(this.commentList);
}

class ErrorLoadingMoreState extends CommentListState {
  final List<Comment> commentList;
  final String message;

  ErrorLoadingMoreState(this.commentList, this.message);
}

class ErrorState extends CommentListState {
  final String message;

  ErrorState(this.message);
}
