import 'package:flutter/material.dart';

import 'package:mipagina/utils/colores.dart';
import 'package:mipagina/utils/utils.dart';
import 'package:mipagina/utils/responsive.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Cv extends StatelessWidget {
  const Cv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Responsive.isDesktop(context)
          ? EdgeInsets.only(top: 70, bottom: 70, left: 70, right: 70)
          : EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      child: Flex(
        direction: isWideScreen(MediaQuery.of(context).size.height,
                MediaQuery.of(context).size.width)
            ? Axis.vertical
            : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              //color: Colors.green,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "MI CURRíCULUM",
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
                            TextSpan(text: "Mi "),
                            TextSpan(
                              text: "currículum",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorTemaMenu),
                            ),
                            TextSpan(
                              text: " vitae",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flex(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      direction: isWideScreen(
                              MediaQuery.of(context).size.height,
                              MediaQuery.of(context).size.width)
                          ? Axis.horizontal
                          : Axis.vertical,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "FORMACIÓN",
                                style:
                                    fuente(1, colorMenu, 25, FontWeight.bold),
                              ),
                              Container(
                                height: 50,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        SelectableText(
                                          "En curso",
                                          style: fuente(1, colorMenu, 20,
                                              FontWeight.w600),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        SelectableText(
                                          "Facultad de ingeniería (Udelar)",
                                          textAlign: TextAlign.center,
                                          style: fuente(
                                              2,
                                              Colors.black.withOpacity(1),
                                              18,
                                              FontWeight.w300),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        Divider(
                                          thickness: 2,
                                          color: colorMenu.withOpacity(0.5),
                                          indent: 50,
                                          endIndent: 50,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SelectableText(
                                          "2017 - 2017: ",
                                          style: fuente(1, colorMenu, 20,
                                              FontWeight.w600),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        SelectableText(
                                          "Analista GeneXus 15 (Jovenes a programar)",
                                          textAlign: TextAlign.center,
                                          style: fuente(
                                              2,
                                              Colors.black.withOpacity(1),
                                              18,
                                              FontWeight.w300),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        Divider(
                                          thickness: 2,
                                          indent: 50,
                                          endIndent: 50,
                                          color: colorMenu.withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SelectableText(
                                          "2013 - 2016: ",
                                          style: fuente(1, colorMenu, 20,
                                              FontWeight.w600),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        SelectableText(
                                          "Escuela Superior de Informática",
                                          textAlign: TextAlign.center,
                                          style: fuente(
                                              2,
                                              Colors.black.withOpacity(1),
                                              18,
                                              FontWeight.w300),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                          child: Column(
                            children: [
                              Text(
                                "HABILIDADES",
                                style:
                                    fuente(1, colorMenu, 25, FontWeight.bold),
                              ),
                              Container(
                                height: 15,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                child: Column(
                                  children: [
                                    SelectableText(
                                      "Java",
                                      style: fuente(
                                          2,
                                          Colors.black.withOpacity(1),
                                          18,
                                          FontWeight.w400),
                                    ),
                                    BarrDeProgreso(progreso: 75),
                                    SelectableText(
                                      "Flutter ",
                                      style: fuente(
                                          2,
                                          Colors.black.withOpacity(1),
                                          18,
                                          FontWeight.w400),
                                    ),
                                    BarrDeProgreso(progreso: 85),
                                    SelectableText(
                                      "GeneXus ",
                                      style: fuente(
                                          2,
                                          Colors.black.withOpacity(1),
                                          18,
                                          FontWeight.w400),
                                    ),
                                    BarrDeProgreso(progreso: 60),
                                    SelectableText(
                                      "HTML / CSS ",
                                      style: fuente(
                                          2,
                                          Colors.black.withOpacity(1),
                                          18,
                                          FontWeight.w400),
                                    ),
                                    BarrDeProgreso(progreso: 70),
                                    SelectableText(
                                      ".Net ",
                                      style: fuente(
                                          2,
                                          Colors.black.withOpacity(1),
                                          18,
                                          FontWeight.w400),
                                    ),
                                    BarrDeProgreso(progreso: 50),
                                    SelectableText(
                                      "c++ ",
                                      style: fuente(
                                          2,
                                          Colors.black.withOpacity(1),
                                          18,
                                          FontWeight.w400),
                                    ),
                                    BarrDeProgreso(progreso: 70),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Flex(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      direction: isWideScreen(
                              MediaQuery.of(context).size.height,
                              MediaQuery.of(context).size.width)
                          ? Axis.horizontal
                          : Axis.vertical,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "CERTIFICADOS",
                                style:
                                    fuente(1, colorMenu, 25, FontWeight.bold),
                              ),
                              Container(
                                height: 15,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        SelectableText(
                                          "\u2022 Analista GeneXus 15\n\u2022 Bachiller tecnológico en informática",
                                          textAlign: TextAlign.center,
                                          style: fuente(1, colorTemaMenu, 20,
                                              FontWeight.w600),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                          child: Column(
                            children: [
                              Text(
                                "IDIOMAS",
                                style:
                                    fuente(1, colorMenu, 25, FontWeight.bold),
                              ),
                              Container(
                                height: 15,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 4,
                                child: Column(
                                  children: [
                                    SelectableText(
                                      "Español",
                                      style: fuente(
                                          2,
                                          Colors.black.withOpacity(1),
                                          18,
                                          FontWeight.w400),
                                    ),
                                    BarrDeProgreso(progreso: 100),
                                    SelectableText(
                                      "Inglés",
                                      style: fuente(
                                          2,
                                          Colors.black.withOpacity(1),
                                          18,
                                          FontWeight.w400),
                                    ),
                                    BarrDeProgreso(progreso: 85),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      //boton
                      height: 75,
                      width: 200,
                      margin: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                          color: colorTemaMenu,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        child: Container(
                          child: Container(
                            child: Center(
                              child: Text(
                                "Descargar",
                                textAlign: TextAlign.center,
                                style: fuente(
                                    1, Colors.white, 20, FontWeight.w300),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Utils.openLink(
                              url:
                                  "https://drive.google.com/drive/folders/1rJyha4oRD8Ttm_3uJ_EUbe5iQLsBydcq");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BarrDeProgreso extends StatelessWidget {
  const BarrDeProgreso({Key? key, required this.progreso}) : super(key: key);

  final double progreso;

  @override
  Widget build(BuildContext context) {
    final Brightness _brightness = Theme.of(context).brightness;
    return Container(
      width: MediaQuery.of(context).size.width / 5,
      child: SfLinearGauge(
        orientation: LinearGaugeOrientation.horizontal,
        minimum: 0.0,
        maximum: 100.0,
        showTicks: false,
        showLabels: false,
        animateAxis: true,
        barPointers: <LinearBarPointer>[
          LinearBarPointer(
              value: progreso,
              thickness: 15,
              edgeStyle: LinearEdgeStyle.bothCurve,
              color: colorTemaMenu),
        ],
        axisTrackStyle: LinearAxisTrackStyle(
          thickness: 15,
          edgeStyle: LinearEdgeStyle.bothCurve,
          borderWidth: 1,
          borderColor: _brightness == Brightness.dark
              ? const Color(0xff898989)
              : Colors.grey[350],
          color: _brightness == Brightness.dark
              ? Colors.transparent
              : Colors.grey[350],
        ),
      ),
    );
  }
}
