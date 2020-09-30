import 'package:learn_english/app/modules/vocabulary/domain/entities/result_context.dart';
import 'package:learn_english/app/modules/vocabulary/domain/errors/errors.dart';

abstract class SearchState{}

class StartState implements SearchState {
  const StartState();
}

class LoadingState implements SearchState {
   const LoadingState();
}

class ErrorState implements SearchState {
  final FailureSearch error;
  const ErrorState(this.error);
}

class SuccessState implements SearchState {
    final List<ResultContext> list;
  const SuccessState(this.list);
}