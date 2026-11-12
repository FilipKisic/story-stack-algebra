import 'dart:math' as math;
import 'package:story_stack/data/client/item_http_client.dart';
import 'package:story_stack/domain/entity/comment.dart';
import 'package:story_stack/domain/entity/result.dart';
import 'package:story_stack/domain/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final ItemHttpClient _itemHttpClient;

  CommentRepositoryImpl(this._itemHttpClient);

  final List<int> commentList = [];
  final int _pageSize = 10;

  @override
  Future<Result<List<Comment>>> getComments(int page) async {
    try {
      final nextCommentsToFetch = _getNextPageIds(page);
      final result = await nextCommentsToFetch.map((comment) => _itemHttpClient.getComment(comment)).wait;

      return Result.ok(result);
    } catch (e) {
      return Result.error(Exception(e));
    }
  }

  @override
  bool hasMoreComments(int page) {
    final totalNumberOfComments = commentList.length;
    final fetchedNumberOfComments = _pageSize * page;
    return fetchedNumberOfComments < totalNumberOfComments;
  }

  @override
  void cacheTopLevelComments(List<int> kids)=> commentList.addAll(kids);

  List<int> _getNextPageIds(int page) {
    final int startIndex = page * _pageSize;
    final int lastIndex = math.min(startIndex + _pageSize, commentList.length);
    return commentList.sublist(startIndex, lastIndex);
  }
}