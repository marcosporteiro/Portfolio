import 'package:flutter/material.dart';
import 'package:mipagina/utils/responsive.dart';

import 'package:mipagina/main.dart';
import 'package:mipagina/menu.dart';
import 'package:mipagina/utils/utils.dart';
import 'package:mipagina/ventana.dart';

bool sePuedeScrollear = false;

class Cuerpo extends State<MyAppBody> {
  @override
  void initState() {
    super.initState();

    controlador.addListener(() {
      //print(controlador.position.pixels.round());
      posi0 = MediaQuery.of(context).size.height * 0;
      posi1 = MediaQuery.of(context).size.height * 1;
      posi2 = MediaQuery.of(context).size.height * 2;
      posi3 = MediaQuery.of(context).size.height * 3;
      posi4 = MediaQuery.of(context).size.height * 4;

      if (posi0.round() <= (controlador.position.pixels).round()) {
        posiScroll = 0;
        setState(() {
          // ignore: unnecessary_statements
          Botones;
        });
      }
      if (posi1 <= controlador.position.pixels.round()) {
        posiScroll = 1;
        setState(() {
          // ignore: unnecessary_statements
          Botones;
        });
      }
      if (posi2.round() <= controlador.position.pixels.round()) {
        posiScroll = 2;
        setState(() {
          // ignore: unnecessary_statements
          Botones;
        });
      }
      if (posi3.round() <= controlador.position.pixels.round()) {
        posiScroll = 3;
        setState(() {
          // ignore: unnecessary_statements
          Botones;
        });
      }
      if (posi4.round() <= controlador.position.pixels.round()) {
        posiScroll = 4;
        setState(() {
          // ignore: unnecessary_statements
          Botones;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //color: Colors.red,
        child: Container(
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
