import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:story_stack/data/client/item_http_client.dart';
import 'package:story_stack/data/repository/item_repository_impl.dart';
import 'package:story_stack/domain/repository/item_repository.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final itemHttpClientProvider = Provider<ItemHttpClient>(
  (ref) => ItemHttpClient(ref.watch(dioProvider)),
);

final itemRepositoryProvider = Provider<ItemRepository>(
    (ref) => ItemRepositoryImpl(ref.watch(itemHttpClientProvider)),
);

