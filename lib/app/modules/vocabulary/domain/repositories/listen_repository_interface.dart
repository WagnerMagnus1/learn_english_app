import 'package:dartz/dartz.dart';
import 'package:learn_english/app/modules/vocabulary/domain/entities/listen_phrase.dart';
import 'package:learn_english/app/modules/vocabulary/domain/errors/errors.dart';

abstract class  IListenRepository{
  Future<Either<FailureSearch,Listenphrase>> listenphrase(String phrase);
}