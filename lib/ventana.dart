import 'package:flutter/material.dart';
import 'package:mipagina/utils/responsive.dart';
import 'package:mipagina/utils/utils.dart';

import 'utils/colores.dart';
import 'ventanas/about.dart';
import 'ventanas/contact.dart';
import 'ventanas/cv.dart';
import 'ventanas/header.dart';
import 'ventanas/home.dart';
import 'ventanas/portfolio.dart';
import 'menu.dart';

import 'package:provider/provider.dart';

class ventana extends StatelessWidget {
  ventana({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Scaffold(
          key: context.read<MenuController>().scaffoldKey,
          drawer: menu(),
          floatingActionButton:
              Responsive.isDesktop(context) ? null : botonMenu(),
          body: Container(
            color: colorFondo,
            child: ListView.builder(
              itemCount: 5,
              itemExtent: MediaQuery.of(context).size.height,
              controller: controlador,
              itemBuilder: (c, i) => Header(
                  elwid: ItemAmostrar(ventana: i), decoracion: ladecoracion(i)),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemAmostrar extends StatelessWidget {
  const ItemAmostrar({Key? key, required this.ventana}) : super(key: key);
  final int ventana;

  @override
  Widget build(BuildContext context) {
    Widget res;
    switch (ventana) {
      case 0:
        return Home();
      case 1:
        return About();
      case 2:
        return Portfolio();
      case 3:
        return Cv();
      case 4:
        return Contact();
      default:
        return Container(
          color: Colors.red,
          child: Center(
              child: Text(
            "ERROR",
            style: TextStyle(color: Colors.white),
          )),
        );
    }
  }
}
