import 'package:flutter/material.dart';
import 'package:mipagina/utils/responsive.dart';

import '../utils/colores.dart';
import '../utils/utils.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

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
