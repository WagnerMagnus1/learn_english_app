import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_english/app/modules/vocabulary/domain/entities/result_context.dart';
import 'package:learn_english/app/modules/vocabulary/domain/errors/errors.dart';
import 'package:learn_english/app/modules/vocabulary/domain/repositories/search_repository_interface.dart';
import 'package:learn_english/app/modules/vocabulary/domain/usecases/search_by_text.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements ISearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByText(repository);

  test('Deve retornar uma lista de ResultContext', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultContext>[]));
    final result = await usecase('car');
    expect(result | null, isA<List<ResultContext>>());
  });
  test('Deve retornar um InvalidTextError caso o texto seja inválido',
      () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultContext>[]));
    var result = await usecase(null);

    expect(result.fold(id, id), isA<InvalidTextError>());

    result = await usecase("");
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
