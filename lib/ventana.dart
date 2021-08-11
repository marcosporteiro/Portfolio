import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mipagina/main.dart';
import 'package:mipagina/responsive.dart';
import 'menu.dart';
import 'principal.dart';
import 'package:provider/provider.dart';

Color colorFondo = Color(0xFFF5F5F4);
Color colorVentana = Colors.black12;

Color colorOscuro = Color(0xFF393c3f);

Color Texto1 = Colors.white;
Color Texto2 = Colors.black.withOpacity(0.7);

ScrollController controlador = ScrollController();

class ventana extends StatelessWidget {
  ventana({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Scaffold(
          key: context.read<MenuController>().scaffoldKey,
          drawer: menu(),
          floatingActionButton:
              Responsive.isDesktop(context) ? null : botonMenu(),
          body: Container(
            color: colorFondo,
            child: ListView.builder(
              itemCount: 5,
              itemExtent: MediaQuery.of(context).size.height,
              controller: controlador,
              itemBuilder: (c, i) => header(
                  elwid: itemAmostrar(ventana: i), decoracion: ladecoracion(i)),
            ),
          ),
        ),
      ),
    );
  }
}

class header extends StatelessWidget {
  const header({
    Key? key,
    required this.elwid,
    required this.decoracion,
  }) : super(key: key);

  final BoxDecoration decoracion;
  final Widget elwid;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(minWidth: 1000, minHeight: 1000),
      /*padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 10 : 0,
          vertical: Responsive.isDesktop(context) ? 10 : 0),*/
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
  const itemAmostrar({Key? key, required this.ventana}) : super(key: key);

  final int ventana;

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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: Responsive.isDesktop(context) ? 75 : 50),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "",
                  style: fuente(1, textoGrande.withOpacity(0.9),
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
                style: fuente(1, textoGrande.withOpacity(0.7),
                    Responsive.isDesktop(context) ? 25 : 20, FontWeight.w200),
              ),
            ),
            Container(
              height: 75,
              width: 200,
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                  color: colorTemaMenu.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10)),
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
                        style: fuente(1, Colors.white, 20, FontWeight.w300),
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
      ),
    );
  }
}

class about extends StatelessWidget {
  const about({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Responsive.isDesktop(context)
          ? EdgeInsets.only(top: 70, bottom: 70, left: 70, right: 70)
          : EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      child: Flex(
        direction: isWideScreen(MediaQuery.of(context).size.height,
                MediaQuery.of(context).size.width)
            ? Axis.horizontal
            : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: Container(
                //color: Colors.green,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "SOBRE MÍ",
                          style: fuente(1, Colors.black, 40, FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 20),
                        width: 25,
                        child: Divider(
                          thickness: 2,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      Container(
                        width: Responsive.isDesktop(context)
                            ? MediaQuery.of(context).size.width / 3 + 50
                            : null,
                        //color: Colors.green,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "",
                            style: fuente(1, Colors.black.withOpacity(1), 18,
                                FontWeight.w300),
                            children: <TextSpan>[
                              TextSpan(text: "Mi nombre es "),
                              TextSpan(
                                text: "Marcos Porteiro",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: colorTemaMenu),
                              ),
                              TextSpan(
                                text: " tengo ",
                              ),
                              TextSpan(
                                  text: "${Edad(5, 11, 1997)} años",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: colorTemaMenu)),
                              TextSpan(
                                text: " y actualmente estoy viviendo en",
                              ),
                              TextSpan(
                                text: " Montevidedo, Uruguay.",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: colorTemaMenu),
                              ),
                              TextSpan(
                                text:
                                    "\n\nDesde pequeño me llamó mucho la atención la tecnología, poreso luego de hacer 4to de liceo decidí cambiarme a la",
                              ),
                              TextSpan(
                                text: " Utu de informática",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: colorTemaMenu),
                              ),
                              TextSpan(
                                text:
                                    " para estudiar lo que más me apasionaba. Allí tuve mi primer contacto con lo relacionado a lo que hoy busco dedicarme que es,",
                              ),
                              TextSpan(
                                text: " Desarrollar software.",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: colorTemaMenu),
                              ),
                              TextSpan(
                                text: "\n\nActualmente estoy cursando la",
                              ),
                              TextSpan(
                                text: " Facultad de ingeniería",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: colorTemaMenu),
                              ),
                              TextSpan(
                                text:
                                    " donde quiero ampliar mi conocimiento al máximo para llegar a ser un profesional.",
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 0, right: 0),
                        child: Text(
                          "METAS",
                          style: fuente(1, Colors.black, 40, FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 0, right: 0),
                        width: MediaQuery.of(context).size.width / 3 + 50,
                        //color: Colors.green,
                        child: Text(
                          "Actualmente estoy buscando mi primer trabajo en el area de lo que más me gusta, para seguir apreindiendo y crecer.",
                          style: fuente(2, Colors.black.withOpacity(1), 18,
                              FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 0, right: 0),
                        width: MediaQuery.of(context).size.width / 3 + 50,
                        //color: Colors.green,
                        child: Text(
                          "\n\u2022 Conocer muchas tecnologías \n\n\u2022 Trabajar en un buen ambiente\n\n\u2022 Mejorar mis habilidades\n\n\u2022 Seguir aprendiendo mucho más!",
                          style: fuente(2, Colors.black.withOpacity(1), 18,
                              FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          Expanded(
            flex: 0,
            child: Container(
              //constraints: BoxConstraints(minWidth: 500),
              height: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.height
                  : 300,
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.height / 2.1
                  : 350 / 2,
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colorTemaMenu.withOpacity(1),
              ),
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    //backgroundColor: Colors.transparent,
                    child: Image(
                      image: AssetImage("assets/images/fondoAbout.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class portfolio extends StatelessWidget {
  const portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 50, right: 50, left: 50),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: colorFondo.withOpacity(1),
          border: Border.all(
            color: colorVentana.withOpacity(0.0),
          ),
        ),
        child: Center(
          child: Text(
            "Work in progress...",
            style: fuente(1, colorTemaMenu,
                Responsive.isDesktop(context) ? 70 : 20, FontWeight.bold),
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
      margin: EdgeInsets.only(top: 50, bottom: 50, right: 50, left: 50),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: colorFondo.withOpacity(1),
          border: Border.all(
            color: colorVentana.withOpacity(0.0),
          ),
        ),
        child: Center(
          child: Text(
            "Work in progress...",
            style: fuente(1, colorTemaMenu,
                Responsive.isDesktop(context) ? 70 : 20, FontWeight.bold),
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
      margin: EdgeInsets.only(top: 50, bottom: 50, right: 50, left: 50),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: colorFondo.withOpacity(1),
          border: Border.all(
            color: colorVentana.withOpacity(0.0),
          ),
        ),
        child: Center(
          child: Text(
            "Work in progress...",
            style: fuente(1, colorTemaMenu,
                Responsive.isDesktop(context) ? 70 : 20, FontWeight.bold),
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

bool isWideScreen(double altura, double largo) {
  return altura < largo;
}
