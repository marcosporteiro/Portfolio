import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mipagina/menu.dart';
import 'package:mipagina/principal.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
