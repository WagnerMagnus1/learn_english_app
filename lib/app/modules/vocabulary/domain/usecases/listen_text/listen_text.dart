import 'package:learn_english/app/modules/vocabulary/domain/errors/errors.dart';
import 'package:learn_english/app/modules/vocabulary/domain/entities/listen_phrase.dart';
import 'package:dartz/dartz.dart';
import 'package:learn_english/app/modules/vocabulary/domain/repositories/listen_repository_interface.dart';
import 'package:learn_english/app/modules/vocabulary/domain/usecases/listen_text/listen_text_interface.dart';
import '../../../../../shared/extensions/string_extensions.dart';

class ListenText implements IListenText {
  final IListenRepository repository;

  ListenText(this.repository);

  @override
  Future<Either<FailureSearch, Listenphrase>> listenText(String phrase) async {
    if (phrase.isNullOrEmpty()) return Left(DataNotFound());

    return await this.repository.listenphrase(phrase);
  }
}
