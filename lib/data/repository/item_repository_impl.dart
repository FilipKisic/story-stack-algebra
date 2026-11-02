import 'dart:math' as math;

import 'package:story_stack/data/client/item_http_client.dart';
import 'package:story_stack/domain/entity/result.dart';
import 'package:story_stack/domain/entity/story.dart';
import 'package:story_stack/domain/repository/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemHttpClient _itemHttpClient;

  ItemRepositoryImpl(this._itemHttpClient);

  final List<int> _topStoryIdList = [];
  final int _pageSize = 10;

  @override
  Future<Result<Story>> getStoryDetails(int id) async {
    try {
      final result = await _itemHttpClient.getItem(id);
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<Story>>> getTopStories(int page) async {
    try {
      if (_topStoryIdList.isEmpty || page == 0) {
        _topStoryIdList.clear();
        final allTopStories = await _itemHttpClient.getTopStories();
        _topStoryIdList.addAll(allTopStories);
      }

      final List<int> nextPageIds = _getNextPageStoryIdList(page);
      final List<Story> stories = await nextPageIds.map((storyId) => _itemHttpClient.getItem(storyId)).wait;

      return Result.ok(stories);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  bool hasMoreStories(int currentPage) {
    final totalNumberOfStories = _topStoryIdList.length;
    final fetchedStories = (currentPage + 1) * _pageSize;
    return fetchedStories < totalNumberOfStories;
  }

  List<int> _getNextPageStoryIdList(int page) {
    final int startIndex = page * _pageSize;
    final lastIndex = math.min(startIndex + _pageSize, _topStoryIdList.length);
    return _topStoryIdList.sublist(startIndex, lastIndex);
  }
}
