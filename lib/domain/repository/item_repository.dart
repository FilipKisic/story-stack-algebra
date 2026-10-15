import 'package:story_stack/domain/entity/result.dart';
import 'package:story_stack/domain/entity/story.dart';

abstract interface class ItemRepository {
  Future<Result<List<int>>> getTopStories();
  Future<Result<Story>> getStoryDetails(int id);
}