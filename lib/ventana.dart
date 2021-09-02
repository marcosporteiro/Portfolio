import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mipagina/utils/colores.dart';
import 'package:mipagina/ventanas/about.dart';
import 'package:mipagina/ventanas/contact.dart';
import 'package:mipagina/ventanas/cv.dart';
import 'package:mipagina/ventanas/header.dart';
import 'package:mipagina/ventanas/home.dart';
import 'package:mipagina/ventanas/portfolio.dart';
import 'package:mipagina/menu.dart';
import 'package:mipagina/utils/responsive.dart';
import 'package:mipagina/utils/utils.dart';

class Ventana extends StatelessWidget {
  Ventana({Key? key}) : super(key: key);

  List lista = List.generate(
    5,
    (index) => Header(
        elwid: ItemAmostrar(ventana: index),
        decoracion: ladecoracion(index),
        item: index),
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            child: Scaffold(
              key: context.read<MenuController>().scaffoldKey,
              drawer: Menu(),
              floatingActionButton:
                  Responsive.isDesktop(context) ? null : BotonMenu(),
              body: Stack(
                children: [
                  Container(
                    color: colorNegroFondo,
                    child: FondoImagenes(),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    addAutomaticKeepAlives: true,
                    itemCount: lista.length,
                    itemExtent: MediaQuery.of(context).size.height,
                    controller: controlador,
                    itemBuilder: (c, i) => Container(
                      child: lista[i],
                    ),
                  ),
                ],
                /*decoration: BoxDecoration(
                  color: colorNegroFondo,
                  /*image: DecorationImage(
                      image: AssetImage("assets/images/banner2.jpg"),
                      fit: BoxFit.cover),*/
                ),*/
              ),
            ),
          ),
        ],
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
