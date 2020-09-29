

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_english/app/modules/vocabulary/domain/entities/result_context.dart';
import 'package:learn_english/app/modules/vocabulary/domain/errors/errors.dart';
import 'package:learn_english/app/modules/vocabulary/infra/datasources/search_datasource_interface.dart';
import 'package:learn_english/app/modules/vocabulary/infra/models/result_search_model.dart';
import 'package:learn_english/app/modules/vocabulary/infra/repositories/search_repository.dart';
import 'package:mockito/mockito.dart';

class SearchDataSourceMock extends Mock implements ISearchDataSource{} 
main(){

  final datasource = SearchDataSourceMock();
  final repository = SearchRepository(datasource);

  test('deve retornar uma lista de ResultContext', () async {
     when(datasource.getSearch(any)).thenAnswer((_) async => <ResultSearchModel>[]);

     final result = await repository.search("car");

     expect(result | null, isA<List<ResultContext>>());
  });

   test('deve retornar um DataSourceError se o dataSource falhar', () async {
     when(datasource.getSearch(any)).thenThrow(Exception());

     final result = await repository.search("car");

     expect(result.fold(id,id), isA<DataSourceError>());
  });
}