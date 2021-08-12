import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'menu.dart';
import 'principal.dart';

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
  cuerpo createState() => cuerpo();
}
