import 'package:riverpod/riverpod.dart';
import 'package:story_stack/di.dart';
import 'package:story_stack/domain/entity/result.dart';
import 'package:story_stack/domain/repository/item_repository.dart';
import 'package:story_stack/presentation/stories/list/controller/state/story_list_state.dart';

class StoryListController extends Notifier<StoryListState> {
  late final ItemRepository _itemRepository;

  @override
  StoryListState build() {
    _itemRepository = ref.watch(itemRepositoryProvider);
    return LoadingState();
  }

  void getTopStories() async {
    state = LoadingState();

    final result = await _itemRepository.getTopStories();
    switch (result) {
      case Ok<List<int>>():
        state = result.value.isEmpty ? EmptyState() : LoadedState([]);
      case Error<List<int>>():
        state = ErrorState(result.error.toString());
    }
  }
}
