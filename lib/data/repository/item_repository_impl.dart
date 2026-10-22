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

      final int startIndex = page * _pageSize;
      final int lastIndex = (startIndex + _pageSize) - 1;

      final List<int> pageContent = _topStoryIdList.sublist(startIndex, lastIndex);

      final List<Story> result = [];

      for (int storyId in pageContent) {
        final story = await _itemHttpClient.getItem(storyId);
        result.add(story);
      }

      return Result.ok(result);
    } on Exception catch(e) {
      return Result.error(e);
    }
  }
}