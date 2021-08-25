// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:learn_english/app/modules/vocabulary/domain/entities/result_context.dart';
// import 'package:learn_english/app/modules/vocabulary/domain/errors/errors.dart';
// import 'package:learn_english/app/modules/vocabulary/domain/usecases/search_by_text/search_by_text.dart';
// import 'package:learn_english/app/modules/vocabulary/presenter/search/search_controller.dart';
// import 'package:learn_english/app/modules/vocabulary/presenter/search/states/search_state.dart';
// import 'package:mockito/mockito.dart';

// class SearchByTextMock extends Mock implements SearchByText {}

// main() {
//   final usecase = SearchByTextMock();
//   final controller = SearchController(usecase);

//   test('deve retorna um SuccessState', () async {
//     when(usecase.call(any)).thenAnswer((_) async =>  Right(<ResultContext>[]));
//     var result = await controller.makeSearch("text");
//     expect(result, isA<SuccessState>());
//   });

//   test('deve trocar o estado para SuccessState', () async {
//     when(usecase.call(any)).thenAnswer((_) async =>  Right(<ResultContext>[]));
//     await controller.stateReaction("text");
//     expect(controller.state, isA<SuccessState>());
//   });

//     test('deve retornar DataNotFound para quando for retornado uma lista vazia', () async {
//     when(usecase.call(any)).thenAnswer((_) async =>  Left(DataNotFound()));
//     await controller.makeSearch("text");
//     expect(controller.state, isA<ErrorState>());
//   });
// }
