import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_decorated_text/flutter_decorated_text.dart';

import 'package:mipagina/utils/colores.dart';
import 'package:mipagina/utils/responsive.dart';
import 'package:mipagina/utils/utils.dart';

import 'package:mipagina/strings_es.dart' as es;
import 'package:mipagina/strings_en.dart' as en;

//import 'package:styled_text/styled_text.dart';

class MiConsola extends StatefulWidget {
  const MiConsola({Key? key}) : super(key: key);

  @override
  Consola createState() => Consola();
}

class Consola extends State<MiConsola> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      //color: colorNegroFondo.withOpacity(0.5),
      child: Center(
        child: Container(
          width: 700,
          height: 400,
          decoration: BoxDecoration(
            color: Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFF3B3B3B),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color: colorConsolaCerrar,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color: colorConsolaMax,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color: colorConsolaMin,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: 700,
                height: 330,
                child: Container(
                  child: Stack(
                    children: [
                      AnimarTexto(
                        texto: idioma.value ? en.consolaText : es.consolaText,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimarTexto extends StatelessWidget {
  const AnimarTexto({
    Key? key,
    this.texto,
  }) : super(key: key);
  final texto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: TextoAnimado(texto: texto, posi: 0, color: textoGrande));
  }
}

class TextoAnimado extends StatelessWidget {
  const TextoAnimado(
      {Key? key, required this.texto, required this.posi, required this.color})
      : super(key: key);
  final String texto;
  final int posi;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return animar.value >= posi
        ? AnimatedTextKit(
            pause: Duration(seconds: 20),
            isRepeatingAnimation: true,
            onFinished: () {
              animar.value = animar.value + 1;
            },
            animatedTexts: [
              TypewriterAnimatedText(
                texto,
                speed: Duration(milliseconds: 30),
                cursor: "_",
                textStyle: fuente(3, color,
                    Responsive.isDesktop(context) ? 16 : 12, FontWeight.w300),
              ),
            ],
          )
        : Container();
  }
}
