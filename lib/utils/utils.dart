import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mipagina/utils/colores.dart';
import 'package:url_launcher/url_launcher.dart';

ValueNotifier<bool> idioma = ValueNotifier<bool>(false);

double posi0 = 0;
double posi1 = 0;
double posi2 = 0;
double posi3 = 0;
double posi4 = 0;
bool botonClikeado = false;

double posiScroll = 0;

ScrollController controlador = ScrollController();

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
  const String ruta1 = "assets/images/banner3.jpg";

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
  TextStyle lato = GoogleFonts.lato(
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
      return lato;

    default:
      return raleway;
  }
}
