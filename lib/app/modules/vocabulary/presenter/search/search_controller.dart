import 'package:async/async.dart';
import 'package:learn_english/app/modules/vocabulary/domain/usecases/search_by_text/search_by_text.dart';
import 'package:learn_english/app/modules/vocabulary/presenter/search/states/search_state.dart';
import 'package:mobx/mobx.dart';

part 'search_controller.g.dart';

class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase with Store {
  final SearchByText usecase;

  @observable
  String searchText = "";

  @observable
  SearchState state = StartState();
  
  CancelableOperation? cancellableOperation;

  _SearchControllerBase(this.usecase) {
    reaction((_) => searchText, (String text) async {
      stateReaction(text, cancellableOperation);
    }, delay: 500);
  }

  Future stateReaction(String text, [CancelableOperation? cancellableOperation]) async {
    await cancellableOperation?.cancel();
    cancellableOperation = CancelableOperation<SearchState>.fromFuture(makeSearch(text));
    if (text.isEmpty) {
      setState(StartState());
      return;
    }

    setState(LoadingState());

    setState(await cancellableOperation.valueOrCancellation(LoadingState()));
  }

  Future<SearchState> makeSearch(String text) async {
    var result = await usecase(text);
    return result.fold((l) => ErrorState(l), (r) => SuccessState(r));
  }

  @action
  setSearchText(String value) => searchText = value;

  @action
  setState(SearchState value) => state = value;
}
