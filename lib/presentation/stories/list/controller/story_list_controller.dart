import 'package:riverpod/riverpod.dart';
import 'package:story_stack/di.dart';
import 'package:story_stack/domain/entity/result.dart';
import 'package:story_stack/domain/entity/story.dart';
import 'package:story_stack/domain/repository/item_repository.dart';
import 'package:story_stack/presentation/stories/list/controller/state/story_list_state.dart';

class StoryListController extends Notifier<StoryListState> {
  late final ItemRepository _itemRepository;

  @override
  StoryListState build() {
    _itemRepository = ref.watch(itemRepositoryProvider);
    getFirstPage();
    return LoadingState();
  }

  void getFirstPage() async {
    state = LoadingState();

    final result = await _itemRepository.getTopStories(0);
    switch (result) {
      case Ok<List<Story>>():
        final hasMore = _itemRepository.hasMoreStories(0);
        state = result.value.isEmpty ? EmptyState() : LoadedState(result.value, 1, hasMore);
      case Error<List<Story>>():
        state = ErrorState(result.error.toString());
    }
  }

  void getNextPage() async {
    if (state is! LoadedState) return;

    var currentPage = (state as LoadedState).currentPage;
    final currentStories = (state as LoadedState).stories;
    var hasMore = (state as LoadedState).hasMore;

    if (!hasMore) return;

    state = LoadingMoreState(currentStories);

    final result = await _itemRepository.getTopStories(currentPage);

    switch (result) {
      case Ok<List<Story>>():
        currentStories.addAll(result.value);
        hasMore = _itemRepository.hasMoreStories(currentPage);
        currentPage++;

        state = LoadedState(currentStories, currentPage, hasMore);
      case Error<List<Story>>():
        state = ErrorLoadingMoreState(currentStories, result.error.toString());
    }
  }
}
