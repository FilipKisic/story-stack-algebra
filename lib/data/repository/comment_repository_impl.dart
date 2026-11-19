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
  Future<Result<List<Comment>>> getComments(List<int>? commentIdList, int page) async {
    if (commentIdList == null) return Result.ok([]);

    final nextCommentsToFetch = _getNextPageIds(page);
    if (nextCommentsToFetch.isEmpty) return Result.ok([]);

    try {
      final result = await getCommentsFromList(nextCommentsToFetch);
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
  void cacheTopLevelComments(List<int> kids) => commentList.addAll(kids);

  Future<List<Comment>> getCommentsFromList(List<int> commentIdList) async {
    final List<Comment> commentList = [];
    for (final commentId in commentIdList) {
      final commentDto = await _itemHttpClient.getComment(commentId);

      if (commentDto.deleted == true || commentDto.dead == true) continue;
      final comment = commentDto.toDomain();

      if (commentDto.kids?.isNotEmpty == true) {
        final replies = await getCommentsFromList(commentDto.kids!);
        comment.replies = replies;
      }
      commentList.add(comment);
    }
    return commentList;
  }

  List<int> _getNextPageIds(int page) {
    final int startIndex = page * _pageSize;
    final int lastIndex = math.min(startIndex + _pageSize, commentList.length);
    return commentList.sublist(startIndex, lastIndex);
  }
}
