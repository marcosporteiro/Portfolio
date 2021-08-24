import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:line_icons/line_icons.dart';

import 'package:mipagina/utils/utils.dart';
import 'package:mipagina/utils/colores.dart';

import 'package:mipagina/strings_es.dart' as es;
import 'package:mipagina/strings_en.dart' as en;

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: new BoxConstraints(minHeight: 150, minWidth: 215),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 5,
      color: colorMenu,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopMenu(),
            Botones(idioma.value ? en.boton1 : es.boton1, Icons.home, 0),
            Botones(idioma.value ? en.boton2 : es.boton2, Icons.person, 1),
            Botones(idioma.value ? en.boton4 : es.boton4, Icons.description, 2),
            Botones(idioma.value ? en.boton3 : es.boton3, Icons.collections, 3),
            Botones(idioma.value ? en.boton5 : es.boton5, Icons.mail, 4),
            Container(
              //color: Colors.red,
              constraints: BoxConstraints(minHeight: 20),
              height: MediaQuery.of(context).size.height - 650,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              //color: Colors.white,
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () => Utils.openLink(
                          url: "https://github.com/marcosporteiro"),
                      child: Icon(
                        LineIcons.github,
                        color: Colors.white.withOpacity(0.1),
                      ),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          Colors.black.withOpacity(0.1),
                        ),
                        splashFactory: NoSplash.splashFactory,
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () => Utils.openLink(
                          url:
                              "https://www.linkedin.com/in/marcos-ignacio-porteiro-fernandez/"),
                      child: Icon(
                        LineIcons.linkedinIn,
                        color: Colors.white.withOpacity(0.1),
                      ),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          Colors.black.withOpacity(0.1),
                        ),
                        splashFactory: NoSplash.splashFactory,
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "miporteiro@hotmail.com",
                style: fuente(
                    1, Colors.white.withOpacity(0.2), 12, FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool activo(int posi) {
  if (posi == posiScroll) {
    return true;
  } else {
    return false;
  }
}

Color getColor(int posi) {
  if (activo(posi)) {
    return Colors.black.withOpacity(0.4);
  } else {
    return Colors.black.withOpacity(0.2);
  }
}

class Botones extends StatelessWidget {
  Botones(this.texto, this.icono, this.posi, {Key? key}) : super(key: key);

  final IconData icono;
  final double posi;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(top: 10, left: 20),
          child: new Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: getColor(posi.toInt()),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              border: Border.all(
                color: Colors.black.withOpacity(0),
              ),
            ),
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  Colors.black.withOpacity(0.1),
                ),
                splashFactory: NoSplash.splashFactory,
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                  ),
                ),
              ),
              child: Container(
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 25),
                        child: Text(
                          this.texto,
                          style: fuente(1, Colors.white, 15, FontWeight.w200),
                        ),
                      ),
                      Container(
                        child: Icon(
                          this.icono,
                          color: colorTemaMenu,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onPressed: () {
                controlador.animateTo(posi * MediaQuery.of(context).size.height,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeIn);
                posi0 = MediaQuery.of(context).size.height * 0;
                posi1 = MediaQuery.of(context).size.height * 1;
                posi2 = MediaQuery.of(context).size.height * 2;
                posi3 = MediaQuery.of(context).size.height * 3;
                posi4 = MediaQuery.of(context).size.height * 4;
              },
            ),
          ),
        ),
      ],
    );
  }
}

class TopMenu extends StatelessWidget {
  const TopMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          constraints: new BoxConstraints(minHeight: 150, minWidth: 100),
          height: 150,
          width: MediaQuery.of(context).size.width / 14,
          //color: Colors.black,
          child: Container(
            margin: EdgeInsets.only(
              top: 25,
              bottom: 25,
              left: 40,
            ),
            child: Container(
              child: CircleAvatar(
                backgroundColor: colorTemaMenu.withOpacity(0),
                backgroundImage: AssetImage("assets/images/avatar.png"),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 160,
            //color: Colors.red,
            margin: EdgeInsets.all(0),
            child: Container(
              margin: EdgeInsets.only(top: 50, right: 25),
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      idioma.value ? en.nombre : es.nombre,
                      style: fuente(1, textoGrande, 21, FontWeight.w600),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      idioma.value ? en.menu1 : es.menu1,
                      style: fuente(1, textoChico, 11, FontWeight.normal),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      idioma.value ? en.menu2 : es.menu2,
                      style: fuente(1, textoChico, 11, FontWeight.normal),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BotonMenu extends StatelessWidget {
  const BotonMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 75,
          right: MediaQuery.of(context).size.width - 75),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: colorMenu.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white.withOpacity(0.8),
          size: 25,
        ),
        onPressed: context.read<MenuController>().controlMenu,
      ),
    );
  }
}

class MenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
