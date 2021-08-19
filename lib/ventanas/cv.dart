import 'package:flutter/material.dart';

import 'package:mipagina/utils/colores.dart';
import 'package:mipagina/utils/utils.dart';
import 'package:mipagina/utils/responsive.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:mipagina/strings_es.dart' as es;
import 'package:mipagina/strings_en.dart' as en;

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
                        ingles ? en.cv1 : es.cv1,
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
                            TextSpan(text: ingles ? en.cv2 : es.cv2),
                            TextSpan(
                              text: ingles ? en.cv3 : es.cv3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorTemaMenu),
                            ),
                            TextSpan(
                              text: ingles ? en.cv4 : es.cv4,
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
                                ingles ? en.cv5 : es.cv5,
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
                                          ingles ? en.cv6 : es.cv6,
                                          style: fuente(1, colorMenu, 20,
                                              FontWeight.w600),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        SelectableText(
                                          ingles ? en.cv7 : es.cv7,
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
                                          ingles ? en.cv8 : es.cv8,
                                          style: fuente(1, colorMenu, 20,
                                              FontWeight.w600),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        SelectableText(
                                          ingles ? en.cv9 : es.cv9,
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
                                          ingles ? en.cv10 : es.cv10,
                                          style: fuente(1, colorMenu, 20,
                                              FontWeight.w600),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        SelectableText(
                                          ingles ? en.cv11 : es.cv11,
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
                                ingles ? en.cv12 : es.cv12,
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
                                      ingles ? en.cv13 : es.cv13,
                                      style: fuente(
                                          2,
                                          Colors.black.withOpacity(1),
                                          18,
                                          FontWeight.w400),
                                    ),
                                    BarrDeProgreso(progreso: 75),
                                    SelectableText(
                                      ingles ? en.cv14 : es.cv14,
                                      style: fuente(
                                          2,
                                          Colors.black.withOpacity(1),
                                          18,
                                          FontWeight.w400),
                                    ),
                                    BarrDeProgreso(progreso: 85),
                                    SelectableText(
                                      ingles ? en.cv15 : es.cv15,
                                      style: fuente(
                                          2,
                                          Colors.black.withOpacity(1),
                                          18,
                                          FontWeight.w400),
                                    ),
                                    BarrDeProgreso(progreso: 60),
                                    SelectableText(
                                      ingles ? en.cv16 : es.cv16,
                                      style: fuente(
                                          2,
                                          Colors.black.withOpacity(1),
                                          18,
                                          FontWeight.w400),
                                    ),
                                    BarrDeProgreso(progreso: 70),
                                    SelectableText(
                                      ingles ? en.cv17 : es.cv17,
                                      style: fuente(
                                          2,
                                          Colors.black.withOpacity(1),
                                          18,
                                          FontWeight.w400),
                                    ),
                                    BarrDeProgreso(progreso: 50),
                                    SelectableText(
                                      ingles ? en.cv18 : es.cv18,
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
                                ingles ? en.cv19 : es.cv19,
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
                                          ingles ? en.cv20 : es.cv20,
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
                                ingles ? en.cv21 : es.cv21,
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
                                      ingles ? en.cv22 : es.cv22,
                                      style: fuente(
                                          2,
                                          Colors.black.withOpacity(1),
                                          18,
                                          FontWeight.w400),
                                    ),
                                    BarrDeProgreso(progreso: 100),
                                    SelectableText(
                                      ingles ? en.cv23 : es.cv23,
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
                                ingles ? en.cv24 : es.cv24,
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
