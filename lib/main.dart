import 'package:flutter/material.dart';
import 'package:learn_english/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learn_english/app/app_widget.dart';

void main() => runApp(ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ));