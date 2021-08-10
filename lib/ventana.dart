import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mipagina/main.dart';
import 'package:mipagina/responsive.dart';
import 'menu.dart';
import 'principal.dart';
import 'package:provider/provider.dart';

Color colorFondo = Colors.grey.shade300;
Color colorVentana = Colors.black12;

Color Texto1 = Colors.white;
Color Texto2 = Colors.black.withOpacity(0.7);

ScrollController controlador = ScrollController();

class ventana extends StatelessWidget {
  ventana({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: colorFondo,
        child: Scaffold(
          key: context.read<MenuController>().scaffoldKey,
          drawer: menu(),
          floatingActionButton:
              Responsive.isDesktop(context) ? null : botonMenu(),
          body: ListView.builder(
            itemCount: 5,
            itemExtent: MediaQuery.of(context).size.height,
            controller: controlador,
            itemBuilder: (c, i) => header(
                elwid: itemAmostrar(ventana: i), decoracion: ladecoracion(i)),
          ),
        ),
      ),
    );
  }
}

class header extends StatelessWidget {
  final Widget elwid;
  final BoxDecoration decoracion;
  const header({
    Key? key,
    required this.elwid,
    required this.decoracion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(minWidth: 1000, minHeight: 1000),
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 10 : 0,
          vertical: Responsive.isDesktop(context) ? 10 : 0),
      decoration: decoracion,
      child: this.elwid,
    );
  }
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

class itemAmostrar extends StatelessWidget {
  final int ventana;
  const itemAmostrar({Key? key, required this.ventana}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget res;
    switch (ventana) {
      case 0:
        return home();
      case 1:
        return about();
      case 2:
        return portfolio();
      case 3:
        return cv();
      case 4:
        return contact();
      default:
        return Container(
          color: Colors.red,
          child: Center(
              child: Text(
            "ERROR",
            style: TextStyle(color: Colors.white),
          )),
        );
    }
  }
}

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      //color: Colors.white,
      margin: Responsive.isDesktop(context)
          ? EdgeInsets.only(top: 150, bottom: 10, left: 150, right: 150)
          : EdgeInsets.only(top: 150, bottom: 0, left: 5, right: 5),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "",
                style: fuente(textoGrande.withOpacity(0.9),
                    Responsive.isDesktop(context) ? 40 : 25, FontWeight.w100),
                children: <TextSpan>[
                  TextSpan(text: "Hola! mi nombre es "),
                  TextSpan(
                      text: "Marcos Porteiro",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: textoGrande)),
                  TextSpan(
                      text:
                          ", y voy a contarte Quién soy, y mostrarte un poco de lo que hago. "),
                ],
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: Responsive.isDesktop(context) ? 50 : 45),
            child: Text(
              "¿Me quieres conocer?",
              style: fuente(textoGrande.withOpacity(0.7),
                  Responsive.isDesktop(context) ? 25 : 20, FontWeight.w200),
            ),
          ),
          Container(
            height: 75,
            width: 200,
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
                color: colorTemaMenu, borderRadius: BorderRadius.circular(10)),
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  Colors.black.withOpacity(0.1),
                ),
                splashFactory: NoSplash.splashFactory,
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              child: Container(
                child: Container(
                  child: Center(
                    child: Text(
                      "Leer más",
                      textAlign: TextAlign.center,
                      style: fuente(Colors.white, 20, FontWeight.w300),
                    ),
                  ),
                ),
              ),
              onPressed: () {
                controlador.animateTo(1 * MediaQuery.of(context).size.height,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
                posi0 = MediaQuery.of(context).size.height * 0;
                posi1 = MediaQuery.of(context).size.height * 1;
                posi2 = MediaQuery.of(context).size.height * 2;
                posi3 = MediaQuery.of(context).size.height * 3;
                posi4 = MediaQuery.of(context).size.height * 4;
              },
            ),
          ),
        ],
      ),
    );
  }
}
/*
class about extends StatelessWidget {
  const about({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        //color: colorVentana.withOpacity(0.2),
      ),
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "",
                style: fuente(textoGrande.withOpacity(0.9),
                    Responsive.isDesktop(context) ? 40 : 32, FontWeight.w100),
                children: <TextSpan>[
                  TextSpan(
                      text: "¿Quién soy?\n",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: colorTemaMenu)),
                  TextSpan(text: "\n"),
                  TextSpan(
                      text: "Mi nombre es Marcos Porteiro, tengo " +
                          Edad(5, 11, 1997).toString() +
                          " años, vivo en Montevideo Uruguay y desde pequeño me apasionó todo el tema de la informática. Esto me llevo a realizar la UTU en la Escuela superior de Informática donde confirmé mi pasión, donde allí experimenté la programación por primera vez. En 2017 en mi ultimo año de la UTU tuve la oportundiad gracias a Jovenes a programar de realizar un curso de GeneXus 15 donde aprendí otras formas de desarrollo y obvtuve el título de Analista Genexus 15. Hoy en día estoy buscando mi primer trabajo como desarrollador ya que me encantaría poder vivir de lo que gusta.",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 25)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/

class about extends StatelessWidget {
  const about({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 50,
            sigmaY: 50,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colorVentana.withOpacity(0.0),
              border: Border.all(
                color: colorVentana.withOpacity(0.0),
              ),
            ),
            child: Center(
              child: Text(
                "Work in progress...",
                style: fuente(colorTemaMenu,
                    Responsive.isDesktop(context) ? 70 : 20, FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

int Edad(int dia, mes, anio) {
  DateTime cumple = DateTime(anio, mes, dia);
  DateTime hoy = DateTime.now();
  int edad = hoy.difference(cumple).inDays;
  edad = (edad / 365).toInt();

  return edad;
}

class portfolio extends StatelessWidget {
  const portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 50,
            sigmaY: 50,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colorVentana.withOpacity(0.0),
              border: Border.all(
                color: colorVentana.withOpacity(0.0),
              ),
            ),
            child: Center(
              child: Text(
                "Work in progress...",
                style: fuente(colorTemaMenu,
                    Responsive.isDesktop(context) ? 70 : 20, FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class cv extends StatelessWidget {
  const cv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 50,
            sigmaY: 50,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colorVentana.withOpacity(0.0),
              border: Border.all(
                color: colorVentana.withOpacity(0.0),
              ),
            ),
            child: Center(
              child: Text(
                "Work in progress...",
                style: fuente(colorTemaMenu,
                    Responsive.isDesktop(context) ? 70 : 20, FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class contact extends StatelessWidget {
  const contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 50,
            sigmaY: 50,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colorVentana.withOpacity(0.0),
              border: Border.all(
                color: colorVentana.withOpacity(0.0),
              ),
            ),
            child: Center(
              child: Text(
                "Work in progress...",
                style: fuente(colorTemaMenu,
                    Responsive.isDesktop(context) ? 70 : 20, FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
