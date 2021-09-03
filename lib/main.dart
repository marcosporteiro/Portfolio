import 'package:flutter/material.dart';
import 'package:mipagina/utils/colores.dart';

import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import 'package:mipagina/menu.dart';
import 'package:mipagina/principal.dart';
import 'package:mipagina/utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  idioma.value = obtenerIdioma();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: colorTemaMenu,
        scrollbarTheme: ScrollbarThemeData(
          interactive: true,
          isAlwaysShown: false,
          thumbColor: MaterialStateProperty.all(colorTemaMenu.withOpacity(0.3)),
        ),
      ),
      title: "Marcos Porteiro",
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
  print("Language: " + sysLang);
  if (sysLang == "es") {
    colorTemaMenu = colorTemaMenu1;
    return false;
  } else {
    colorTemaMenu = colorTemaMenu2;
    return true;
  }
}
