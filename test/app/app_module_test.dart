import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_english/app/app_module.dart';
import 'package:learn_english/app/modules/vocabulary/domain/entities/result_context.dart';
import 'package:learn_english/app/modules/vocabulary/domain/usecases/search_by_text.dart';
import 'package:learn_english/app/modules/vocabulary/domain/usecases/search_by_text_interface.dart';
import 'package:learn_english/app/modules/vocabulary/external/datasources/reverso_context_datasource.dart';
import 'package:mockito/mockito.dart';
import 'package:web_scraper/web_scraper.dart';

import 'modules/vocabulary/utils/reverso_context_response.dart';

class WebScraperMock extends Mock implements WebScraper {}
class ReversoContectDatasourceMock extends Mock implements ReversoContectDatasource {}

main() {
  final webScraper = WebScraperMock();

  initModule(AppModule(), changeBinds: [
    Bind((i) => webScraper),
  ]);
  test('Deve recuperar o usecase sem erro', () {
    final usecase = Modular.get<ISearchByText>();
    expect(usecase, isA<SearchByText>());
  });
  test('Deve trazer uma lista de ResultContext', () async {
    when(webScraper.loadWebPage(any)).thenAnswer((_) async => true);
    when(webScraper.getPageContent()).thenAnswer((_) => reversoContextResult);
    when(webScraper.getElement(any, any)).thenAnswer((_) => [
          {'phrase': 'Car', 'translate': 'Carro'}
        ]);
    final usecase = Modular.get<ISearchByText>();
    final result = await usecase.call('house');

    expect(result | null, isA<List<ResultContext>>());
  });

  test('change bind', () {
    expect(Modular.get<WebScraper>(), isA<WebScraperMock>());
  });
}
