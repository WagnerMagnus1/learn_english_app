import 'package:flutter_modular/flutter_modular.dart';
import 'package:learn_english/app/modules/vocabulary/domain/errors/errors.dart';
import 'package:learn_english/app/modules/vocabulary/external/utils/site.dart';
import 'package:learn_english/app/modules/vocabulary/infra/datasources/search_datasource_interface.dart';
import 'package:learn_english/app/modules/vocabulary/infra/models/result_search_model.dart';
import 'package:web_scraper/web_scraper.dart';

@Injectable(singleton: false)
class ReversoContectDatasource implements ISearchDataSource {
  final WebScraper webScraper;

  ReversoContectDatasource(this.webScraper);
  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    if (await this.webScraper.loadWebPage('$SUBDOMAIN/$searchText')) {
      final response = await _scrapPhrases();
      return response;
    } else {
      throw DataSourceError(message: 'Não foi possível acessar o link: $DOMAIN');
    }
  }

  Future<List<ResultSearchModel>> _scrapPhrases() async {
    List<Map<String, dynamic>> elementsPhrases = this.webScraper.getElement(".example", []);
    List<ResultSearchModel> listResultSearchModel = [];
    for (var review in elementsPhrases) {
      List<String> phrasesSplit = review['title'].toString().trim().split('\n');
      Map<String, dynamic> newMap = {};
      newMap['phrase'] = phrasesSplit[0].trim();
      newMap['translate'] = phrasesSplit.last.trim();
      listResultSearchModel.add(ResultSearchModel.fromMap(newMap));
    }

    return listResultSearchModel;
  }
}
