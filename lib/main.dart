import 'package:flutter/material.dart';
import 'principal.dart';

Color colorMenu = Color(0xFF222629);
Color colorTemaMenu = Color(0xFF4caf76);

Color textoGrande = Colors.white;
Color textoChico = Colors.white.withOpacity(0.5);

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
      home: MyAppBody(),
    );
  }
}

class MyAppBody extends StatefulWidget {
  MyAppBody({Key? key}) : super(key: key);

  @override
  cuerpo createState() => cuerpo();
}
