import 'package:story_stack/domain/entity/comment.dart';
import 'package:story_stack/domain/entity/result.dart';

abstract interface class CommentRepository {
  Future<Result<List<Comment>>> getComments(List<int>? commentIdList, int page);
  bool hasMoreComments(int page);
  void cacheTopLevelComments(List<int> kids);
}