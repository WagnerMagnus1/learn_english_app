import 'package:flutter_test/flutter_test.dart';
import 'package:learn_english/app/modules/vocabulary/domain/errors/errors.dart';
import 'package:learn_english/app/modules/vocabulary/external/datasources/reverso_context_datasource.dart';
import 'package:mockito/mockito.dart';
import 'package:web_scraper/web_scraper.dart';

import '../../utils/reverso_context_response.dart';

class WebScraperMock extends Mock implements WebScraper {}

main() {
  final webScraper = WebScraperMock();
  final datasource = ReversoContectDatasource(webScraper);
  test('Deve retornar uma lista de ResultSearchModel', () async {
    when(webScraper.loadWebPage(any)).thenAnswer((_) async => true);
    when(webScraper.getPageContent()).thenAnswer((_) => reversoContextResult);
    when(webScraper.getElement(any, any)).thenAnswer((_) => [
          {'phrase': 'Car', 'translate': 'Carro'}
        ]);

    final future = datasource.getSearch('searchText');
    expect(future, completes);
  });
  test('Deve retornar um erro se o site ReversoContext estiver inacessível', () async {
    when(webScraper.loadWebPage(any)).thenAnswer((_) async => false);

    final future = datasource.getSearch('searchText');
    expect(future, throwsA(isA<DataSourceError>()));
  });

  test('Deve retornar um erro caso exista um erro na lib WebScraper', () async {
    when(webScraper.loadWebPage(any)).thenThrow(Exception());

    final future = datasource.getSearch('searchText');
    expect(future, throwsA(isA<Exception>()));
  });
}
