import 'package:learn_english/app/modules/vocabulary/infra/models/result_search_model.dart';

abstract class ISearchDataSource {
  Future<List<ResultSearchModel>> getSearch(String searchText);
}
