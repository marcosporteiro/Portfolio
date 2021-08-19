import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import 'package:mipagina/menu.dart';
import 'package:mipagina/principal.dart';
import 'package:mipagina/utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ingles = obtenerIdioma();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Marcos Porteiro",
      //home: MyAppBody(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: MyAppBody(),
      ),
    );
  }
}

class MyAppBody extends StatefulWidget {
  MyAppBody({Key? key}) : super(key: key);

  @override
  Cuerpo createState() => Cuerpo();
}

bool obtenerIdioma() {
  String sysLang = ui.window.locale.languageCode;
  print("Lang: " + sysLang);
  if (sysLang == "es") {
    return false;
  } else {
    return true;
  }
}
