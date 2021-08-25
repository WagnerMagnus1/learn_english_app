import 'package:learn_english/app/modules/vocabulary/domain/errors/errors.dart';
import 'package:learn_english/app/modules/vocabulary/domain/entities/result_context.dart';
import 'package:dartz/dartz.dart';
import 'package:learn_english/app/modules/vocabulary/domain/repositories/search_repository_interface.dart';
import 'package:learn_english/app/modules/vocabulary/domain/usecases/search_by_text/search_by_text_interface.dart';
import '../../../../../shared/extensions/string_extensions.dart';

class SearchByText implements ISearchByText{

  final ISearchRepository repository;

  SearchByText(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultContext>>> call(String searchText) async {

      if(searchText.isNullOrEmpty()) return Left(InvalidTextError());
      
      return repository.search(searchText);
  }

}