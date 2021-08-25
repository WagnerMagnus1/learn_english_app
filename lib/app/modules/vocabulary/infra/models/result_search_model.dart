import 'dart:convert';

import 'package:learn_english/app/modules/vocabulary/domain/entities/result_context.dart';

class ResultSearchModel extends ResultContext {
  final String phrase;
  final String translate;

  ResultSearchModel({required this.phrase, required this.translate}) : super(phrase: phrase, translate: translate);

  Map<String, dynamic> toMap() {
    return {
      'phrase': phrase,
      'translate': translate,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      phrase: map['phrase'],
      translate: map['translate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) => ResultSearchModel.fromMap(json.decode(source));
}
