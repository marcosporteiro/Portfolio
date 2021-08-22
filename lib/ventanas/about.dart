import 'package:flutter/material.dart';
import 'package:mipagina/utils/responsive.dart';
import 'package:mouse_parallax/mouse_parallax.dart';

import 'package:mipagina/principal.dart';
import 'package:mipagina/utils/utils.dart';
import 'package:mipagina/utils/colores.dart';

import 'package:mipagina/strings_es.dart' as es;
import 'package:mipagina/strings_en.dart' as en;

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
                        idioma.value ? en.about1 : es.about1,
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
                            TextSpan(
                                text: idioma.value ? en.about2 : es.about2),
                            TextSpan(
                              text: idioma.value ? en.nombre : es.nombre,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorTemaMenu),
                            ),
                            TextSpan(
                              text: idioma.value ? en.about4 : es.about4,
                            ),
                            TextSpan(
                                text: idioma.value ? en.about5 : es.about5,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: colorTemaMenu)),
                            TextSpan(
                              text: idioma.value ? en.about6 : es.about6,
                            ),
                            TextSpan(
                              text: idioma.value ? en.about7 : es.about7,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorTemaMenu),
                            ),
                            TextSpan(
                              text: idioma.value ? en.about8 : es.about8,
                            ),
                            TextSpan(
                              text: idioma.value ? en.about9 : es.about9,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorTemaMenu),
                            ),
                            TextSpan(
                              text: idioma.value ? en.about10 : es.about10,
                            ),
                            TextSpan(
                              text: idioma.value ? en.about11 : es.about11,
                            ),
                            TextSpan(
                              text: idioma.value ? en.about12 : es.about12,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorTemaMenu),
                            ),
                            TextSpan(
                              text: idioma.value ? en.about13 : es.about13,
                            ),
                            TextSpan(
                              text: idioma.value ? en.about14 : es.about14,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorTemaMenu),
                            ),
                            TextSpan(
                              text: idioma.value ? en.about15 : es.about15,
                            ),
                            TextSpan(
                              text: idioma.value ? en.about16 : es.about16,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorTemaMenu),
                            ),
                            TextSpan(
                              text: idioma.value ? en.about17 : es.about17,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 0, right: 0),
                      child: Text(
                        idioma.value ? en.about18 : es.about18,
                        style: fuente(1, colorMenu, 40, FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 0, right: 0),
                      width: (MediaQuery.of(context).size.width / 3) + 50,
                      //color: Colors.green,
                      child: Text(
                        idioma.value ? en.about19 : es.about19,
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
                        idioma.value ? en.about20 : es.about20,
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
