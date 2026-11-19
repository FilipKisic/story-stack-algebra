import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_stack/di.dart';
import 'package:story_stack/domain/entity/comment.dart';
import 'package:story_stack/domain/entity/result.dart';
import 'package:story_stack/domain/repository/comment_repository.dart';
import 'package:story_stack/presentation/stories/details/controller/state/comment_list_state.dart';

class CommentListController extends Notifier<CommentListState> {
  late final CommentRepository _repository;

  @override
  CommentListState build() {
    _repository = ref.watch(commentRepositoryProvider);
    return LoadingState();
  }

  void getFirstPageOfComments(List<int>? commentIdList) async {
    state = LoadingState();

    if (commentIdList == null || commentIdList.isEmpty) {
      state = EmptyState();
      return;
    }
    _repository.cacheTopLevelComments(commentIdList);

    final result = await _repository.getComments(commentIdList, 0);

    switch (result) {
      case Ok<List<Comment>>():
        state = result.value.isEmpty ? EmptyState() : LoadedState(result.value);
      case Error<List<Comment>>():
        state = ErrorState(result.error.toString());
    }
  }
}