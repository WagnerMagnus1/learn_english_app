import 'package:dartz/dartz.dart';
import 'package:learn_english/app/modules/vocabulary/domain/entities/result_context.dart';
import 'package:learn_english/app/modules/vocabulary/domain/errors/errors.dart';

abstract class ISearchByText{
  Future<Either<FailureSearch,List<ResultContext>>> call(String searchText);
}