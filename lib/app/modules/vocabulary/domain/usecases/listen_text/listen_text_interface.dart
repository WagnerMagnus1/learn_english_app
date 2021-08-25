import 'package:dartz/dartz.dart';
import 'package:learn_english/app/modules/vocabulary/domain/entities/listen_phrase.dart';
import 'package:learn_english/app/modules/vocabulary/domain/errors/errors.dart';

abstract class IListenText {
    Future<Either<FailureSearch, Listenphrase>> listenText(String phrase);
}