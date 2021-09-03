import 'package:flutter/material.dart';
import 'package:mipagina/utils/colores.dart';
import 'package:mipagina/utils/responsive.dart';

import 'package:mipagina/main.dart';
import 'package:mipagina/menu.dart';
import 'package:mipagina/utils/utils.dart';
import 'package:mipagina/ventana.dart';

import 'package:mipagina/ventanas/welcome.dart';

class Cuerpo extends State<MyAppBody> {
  @override
  void initState() {
    super.initState();
    setState(() {
      Future.delayed(Duration.zero, () => abrirConsola(context));
    });

    idioma.addListener(() {
      setState(() {
        // ignore: unnecessary_statements
        Cuerpo;
      });
    });

    controlador.addListener(() {
      //print(controlador.position.pixels.round());

      posi0 = 0;
      posi1 = MediaQuery.of(context).size.height;
      posi2 = MediaQuery.of(context).size.height * 2;
      posi3 = MediaQuery.of(context).size.height * 3;
      posi4 = MediaQuery.of(context).size.height * 4;

      if (posi0.round() <= (controlador.position.pixels.round())) {
        posiScroll.value = 0;
      }
      if (posi1 <= controlador.position.pixels.round()) {
        posiScroll.value = 1;
      }
      if (posi2.round() <= controlador.position.pixels.round()) {
        posiScroll.value = 2;
      }
      if (posi3.round() <= controlador.position.pixels.round()) {
        posiScroll.value = 3;
      }
      if (posi4.round() <= controlador.position.pixels.round()) {
        posiScroll.value = 4;
      }
    });

    /*
    animar.addListener(() {
      setState(() {
        // ignore: unnecessary_statements
        Cuerpo;
      });
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Container(
          color: colorNegroFondo,
          child: Row(
            children: [
              if (Responsive.isDesktop(context)) Menu(),
              Ventana(),
            ],
          ),
        ),
      ),
    );
  }
}
