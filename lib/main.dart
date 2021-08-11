import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'menu.dart';
import 'principal.dart';

Color colorMenu = Color(0xFF222629);
Color colorTemaMenu = Color(0xFF4caf76);

//Color colorTemaMenu = Color(0xFFED6A5A);
Color color2 = Color(0xFF759FBC);
Color color3 = Color(0xFFF4B860);
Color color4 = Color(0xFF8093F1);

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
