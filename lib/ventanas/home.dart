import 'package:flutter/material.dart';

import 'package:mipagina/utils/colores.dart';
import 'package:mipagina/utils/utils.dart';
import 'package:mipagina/utils/responsive.dart';

import 'package:mipagina/strings_es.dart' as es;
import 'package:mipagina/strings_en.dart' as en;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            //width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              top: 10,
            ),
            height: 50,
            child: TextButton(
              onPressed: () {
                if (idioma.value) {
                  idioma.value = false;
                  colorTemaMenu = colorTemaMenu1;
                } else {
                  idioma.value = true;
                  colorTemaMenu = colorTemaMenu2;
                }
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  Colors.black.withOpacity(0.1),
                ),
                splashFactory: NoSplash.splashFactory,
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              child: Text(
                "EN/ES",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: textoGrande.withOpacity(0.7)),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(0),
            margin: Responsive.isDesktop(context)
                ? EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 5.5 - 0,
                    bottom: 10,
                    left: 130,
                    right: 130)
                : EdgeInsets.only(top: 120, bottom: 0, left: 5, right: 5),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: Responsive.isDesktop(context) ? 75 : 50),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "",
                        style: fuente(
                            1,
                            textoGrande.withOpacity(0.9),
                            Responsive.isDesktop(context) ? 40 : 25,
                            FontWeight.w100),
                        children: <TextSpan>[
                          TextSpan(text: idioma.value ? en.home1 : es.home1),
                          TextSpan(
                              text: idioma.value ? en.nombre : es.nombre,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: textoGrande)),
                          TextSpan(text: idioma.value ? en.home3 : es.home3),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: Responsive.isDesktop(context) ? 50 : 45),
                    child: Text(
                      idioma.value ? en.home4 : es.home4,
                      style: fuente(
                          1,
                          textoGrande.withOpacity(0.7),
                          Responsive.isDesktop(context) ? 25 : 20,
                          FontWeight.w200),
                    ),
                  ),
                  Container(
                    //boton
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      child: Container(
                        child: Container(
                          child: Center(
                            child: Text(
                              idioma.value ? en.home5 : es.home5,
                              textAlign: TextAlign.center,
                              style:
                                  fuente(1, Colors.white, 20, FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        controlador.animateTo(
                            1 * MediaQuery.of(context).size.height,
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
          ),
        ],
      ),
    );
  }
}
