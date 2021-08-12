import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

double posi0 = 0;
double posi1 = 0;
double posi2 = 0;
double posi3 = 0;
double posi4 = 0;

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

int Edad(int dia, mes, anio) {
  DateTime cumple = DateTime(anio, mes, dia);
  DateTime hoy = DateTime.now();
  int edad = hoy.difference(cumple).inDays;
  edad = (edad / 365).toInt();

  return edad;
}

bool isWideScreen(double altura, double largo) {
  return altura < largo;
}

BoxDecoration ladecoracion(int item) {
  BoxDecoration decoracion;
  String ruta1 = "assets/images/banner.jpg";

  switch (item) {
    case 0:
      decoracion = BoxDecoration(
        image: DecorationImage(image: AssetImage(ruta1), fit: BoxFit.cover),
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
