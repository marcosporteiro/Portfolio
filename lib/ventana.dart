import 'package:flutter/material.dart';
import 'package:mipagina/utils/responsive.dart';
import 'package:mipagina/utils/utils.dart';
import 'package:provider/provider.dart';

import 'package:mipagina/utils/colores.dart';
import 'package:mipagina/ventanas/about.dart';
import 'package:mipagina/ventanas/contact.dart';
import 'package:mipagina/ventanas/cv.dart';
import 'package:mipagina/ventanas/header.dart';
import 'package:mipagina/ventanas/home.dart';
import 'package:mipagina/ventanas/portfolio.dart';
import 'package:mipagina/menu.dart';

class Ventana extends StatelessWidget {
  Ventana({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Scaffold(
          key: context.read<MenuController>().scaffoldKey,
          drawer: Menu(),
          floatingActionButton:
              Responsive.isDesktop(context) ? null : BotonMenu(),
          body: Container(
            decoration: BoxDecoration(
              color: colorFondo,
              image: DecorationImage(
                  image: AssetImage("assets/images/banner2.jpg"),
                  fit: BoxFit.cover),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              addAutomaticKeepAlives: true,
              itemCount: 5,
              itemExtent: MediaQuery.of(context).size.height,
              controller: controlador,
              itemBuilder: (c, i) => Header(
                  elwid: ItemAmostrar(ventana: i),
                  decoracion: ladecoracion(i),
                  item: i),
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
    switch (ventana) {
      case 0:
        return Home();
      case 1:
        return About();
      case 2:
        return Cv();
      case 3:
        return Portfolio();
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
