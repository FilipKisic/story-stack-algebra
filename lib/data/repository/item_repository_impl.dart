import 'package:story_stack/data/client/item_http_client.dart';
import 'package:story_stack/domain/entity/result.dart';
import 'package:story_stack/domain/entity/story.dart';
import 'package:story_stack/domain/repository/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemHttpClient _itemHttpClient;

  ItemRepositoryImpl(this._itemHttpClient);

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
  Future<Result<List<int>>> getTopStories() async {
    try {
      final result = await _itemHttpClient.getTopStories();
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}