import 'package:flutter_modular/flutter_modular.dart';
import 'package:learn_english/app/modules/vocabulary/domain/repositories/search_repository_interface.dart';
import 'package:learn_english/app/modules/vocabulary/domain/usecases/search_by_text/search_by_text.dart';
import 'package:learn_english/app/modules/vocabulary/domain/usecases/search_by_text/search_by_text_interface.dart';
import 'package:learn_english/app/modules/vocabulary/external/datasources/reverso_context_datasource.dart';
import 'package:learn_english/app/modules/vocabulary/infra/datasources/search_datasource_interface.dart';
import 'package:learn_english/app/modules/vocabulary/infra/repositories/search_repository.dart';
import 'package:learn_english/app/modules/vocabulary/presenter/search/search_page.dart';
import 'package:web_scraper/web_scraper.dart';

import 'external/utils/site.dart';
import 'presenter/search/search_controller.dart';

class VocabularyModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => WebScraper(DOMAIN)),
        Bind.singleton<ISearchDataSource>((i) => ReversoContectDatasource(i())),
        Bind.singleton<ISearchRepository>((i) => SearchRepository(i())),
        Bind.singleton<ISearchByText>((i) => SearchByText(i())),
        Bind.singleton((i) => SearchController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => SearchPage()),
      ];
}
