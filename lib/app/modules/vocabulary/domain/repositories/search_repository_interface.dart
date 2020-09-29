import 'package:dartz/dartz.dart';
import 'package:learn_english/app/modules/vocabulary/domain/entities/result_context.dart';
import 'package:learn_english/app/modules/vocabulary/domain/errors/errors.dart';

abstract class ISearchRepository{
   Future<Either<FailureSearch, List<ResultContext>>> search(String searchText);
}