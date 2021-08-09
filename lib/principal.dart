import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mipagina/responsive.dart';
import 'main.dart';
import 'menu.dart';
import 'ventana.dart';

class cuerpo extends State<MyAppBody> {
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
          botones;
        });
      }
      if (posi1 <= controlador.position.pixels.round()) {
        posiScroll = 1;
        setState(() {
          botones;
        });
      }
      if (posi2.round() <= controlador.position.pixels.round()) {
        posiScroll = 2;
        setState(() {
          botones;
        });
      }
      if (posi3.round() <= controlador.position.pixels.round()) {
        posiScroll = 3;
        setState(() {
          botones;
        });
      }
      if (posi4.round() <= controlador.position.pixels.round()) {
        posiScroll = 4;
        setState(() {
          botones;
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
              if (Responsive.isDesktop(context)) menu(),
              ventana(),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle fuente(Color color, double size, FontWeight weight) {
  return GoogleFonts.raleway(
    color: color,
    fontSize: size,
    fontWeight: weight,
  );
}
