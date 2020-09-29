import 'presenter/search/search_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class VocabularyModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SearchController()),
      ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<VocabularyModule>.of();
}
