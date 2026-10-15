import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:story_stack/domain/entity/story.dart';

part 'item_http_client.g.dart';

@RestApi(baseUrl: 'https://hacker-news.firebaseio.com/v0')
abstract class ItemHttpClient {
  factory ItemHttpClient(Dio dio, {String? baseUrl}) = _ItemHttpClient;

  @GET('/topstories.json')
  Future<List<int>> getTopStories();
  
  @GET('/item/{id}.json')
  Future<Story> getItem(@Path('id') int id);
}