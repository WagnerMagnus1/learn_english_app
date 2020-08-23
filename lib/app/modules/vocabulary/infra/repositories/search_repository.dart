import 'package:learn_english/app/modules/vocabulary/domain/errors/errors.dart';
import 'package:learn_english/app/modules/vocabulary/domain/entities/result_context.dart';
import 'package:dartz/dartz.dart';
import 'package:learn_english/app/modules/vocabulary/domain/repositories/search_repository_interface.dart';
import 'package:learn_english/app/modules/vocabulary/infra/datasources/search_datasource_interface.dart';

class SearchRepository implements ISearchRepository {
  final ISearchDataSource datasource;

  SearchRepository(this.datasource);
  @override
  Future<Either<FailureSearch, List<ResultContext>>> search(
      String searchText) async {
    try {
      final result = await datasource.getSearch(searchText);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch(e){
      return Left(DataSourceError());
    }
  }
}
