import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mipagina/utils/colores.dart';

import 'package:url_launcher/url_launcher.dart';

ValueNotifier<bool> idioma = ValueNotifier<bool>(false);

ValueNotifier<int> animar = ValueNotifier<int>(0);

double posi0 = 0;
double posi1 = 0;
double posi2 = 0;
double posi3 = 0;
double posi4 = 0;

bool botonClikeado = false;

ValueNotifier<double> posiScroll = ValueNotifier<double>(0);

ScrollController controlador = ScrollController();
ScrollController controladorHome = ScrollController();
ScrollController controladorAbout = ScrollController();
ScrollController controladorCv = ScrollController();
ScrollController controladorPortfolio = ScrollController();
ScrollController controladorContact = ScrollController();

class Utils {
  static Future openLink({required String url}) => _launchUrl(url);

  static Future _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}

int edad(int dia, mes, anio) {
  DateTime cumple = DateTime(anio, mes, dia);
  DateTime hoy = DateTime.now();
  int edad = hoy.difference(cumple).inDays;
  edad = edad ~/ 365;

  return edad;
}

bool isWideScreen(double altura, double largo) {
  return altura < largo;
}

BoxDecoration ladecoracion(int item) {
  BoxDecoration decoracion;
  //const String ruta1 = "assets/images/banner3.jpg";

  switch (item) {
    case 0:
      decoracion = BoxDecoration(
          //color: colorFondo,
          //image: DecorationImage(image: AssetImage(ruta1), fit: BoxFit.cover),
          );
      break;
    case 1:
      decoracion = BoxDecoration(
        color: colorFondo,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      );

      break;
    case 2:
      decoracion = BoxDecoration(
        color: colorFondo2,
      );
      break;
    case 3:
      decoracion = BoxDecoration(
        color: colorFondo,
      );
      break;
    case 4:
      decoracion = BoxDecoration(
        color: colorFondo2,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      );
      break;
    default:
      decoracion = BoxDecoration();
  }
  return decoracion;
}

TextStyle fuente(int fuente, Color color, double size, FontWeight weight) {
  TextStyle raleway = GoogleFonts.raleway(
    color: color,
    fontSize: size,
    fontWeight: weight,
  );
  TextStyle roboto = GoogleFonts.roboto(
    color: color,
    fontSize: size,
    fontWeight: weight,
  );
  TextStyle fira = GoogleFonts.firaCode(
    color: color,
    fontSize: size,
    fontWeight: weight,
  );
  switch (fuente) {
    case 1:
      return raleway;
    case 2:
      return roboto;
    case 3:
      return fira;

    default:
      return raleway;
  }
}

class FondoImagenes extends StatelessWidget {
  const FondoImagenes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/1.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/2.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/3.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/4.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/5.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/6.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/7.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/8.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
