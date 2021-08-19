import 'package:flutter/material.dart';
import 'package:mipagina/utils/responsive.dart';
import 'package:mouse_parallax/mouse_parallax.dart';

import 'package:mipagina/principal.dart';
import 'package:mipagina/utils/utils.dart';
import 'package:mipagina/utils/colores.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

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
          Container(
              child: sePuedeScrollear
                  ? Icon(
                      Icons.arrow_downward,
                      color: colorMenu,
                    )
                  : Icon(
                      Icons.arrow_downward,
                      color: Colors.transparent,
                    )),
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
                        style: fuente(1, colorMenu, 40, FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      width: 25,
                      child: Divider(
                        thickness: 2,
                        color: colorMenu,
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
                                text: "${edad(5, 11, 1997)} años",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: colorTemaMenu)),
                            TextSpan(
                              text: " y actualmente estoy viviendo en",
                            ),
                            TextSpan(
                              text: " Montevideo, Uruguay.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorTemaMenu),
                            ),
                            TextSpan(
                              text:
                                  "\n\nDecidí crear esta app/website desde 0 con",
                            ),
                            TextSpan(
                              text: " Flutter",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorTemaMenu),
                            ),
                            TextSpan(
                              text:
                                  " para poder demostrar un poco de lo que soy capaz",
                            ),
                            TextSpan(
                              text:
                                  "\n\nDesde pequeño me llamó mucho la atención la tecnología, por eso luego de hacer 4to de liceo decidí cambiarme a la",
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
                        style: fuente(1, colorMenu, 40, FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 0, right: 0),
                      width: (MediaQuery.of(context).size.width / 3) + 50,
                      //color: Colors.green,
                      child: Text(
                        "Actualmente estoy buscando mi primer trabajo en el área de lo que más me gusta, para seguir aprendiendo y crecer.",
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
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              //constraints: BoxConstraints(minWidth: 500),
              height: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.height
                  : 200,
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.height / 2.25
                  : 350 / 2,
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colorTemaMenu.withOpacity(1),
              ),
              child: ParallaxStack(
                layers: [
                  ParallaxLayer(
                    yRotation: 0.35,
                    xRotation: 0.1,
                    xOffset: 20,
                    yOffset: 20,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
