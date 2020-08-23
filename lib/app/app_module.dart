import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learn_english/app/app_widget.dart';
import 'package:learn_english/app/modules/vocabulary/domain/repositories/search_repository_interface.dart';
import 'package:learn_english/app/modules/vocabulary/domain/usecases/search_by_text.dart';
import 'package:learn_english/app/modules/vocabulary/domain/usecases/search_by_text_interface.dart';
import 'package:learn_english/app/modules/vocabulary/external/datasources/reverso_context_datasource.dart';
import 'package:learn_english/app/modules/vocabulary/external/utils/site.dart';
import 'package:learn_english/app/modules/vocabulary/infra/datasources/search_datasource_interface.dart';
import 'package:learn_english/app/modules/vocabulary/infra/repositories/search_repository.dart';
import 'package:web_scraper/web_scraper.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
      Bind((i) => WebScraper(DOMAIN)),
      Bind<ISearchDataSource>((i) => ReversoContectDatasource(i())),
      Bind<ISearchRepository>((i) => SearchRepository(i())),
      Bind<ISearchByText>((i) => SearchByText(i())),
      ];

  @override
  List<Router> get routers => [
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
