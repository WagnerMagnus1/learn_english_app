abstract class FailureSearch implements Exception{}

class InvalidTextError implements FailureSearch{}

class DataNotFound implements FailureSearch{}

class DataSourceError implements FailureSearch{
  final String message;

  DataSourceError({required this.message});
}