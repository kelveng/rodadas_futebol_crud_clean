import 'package:flutter/material.dart';
import 'package:rodadas_futebol_crud/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_widget.dart';

void main() => runApp(ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ));
