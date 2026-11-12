import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_stack/di.dart';
import 'package:story_stack/domain/repository/comment_repository.dart';
import 'package:story_stack/presentation/stories/details/controller/state/comment_list_state.dart';

class CommentListController extends Notifier<CommentListState> {
  late final CommentRepository _repository;

  @override
  CommentListState build() {
    _repository = ref.watch(commentRepositoryProvider);
    _repository.cacheTopLevelComments(kids);
    _repository.getComments(0);
    return LoadingState();
  }
}