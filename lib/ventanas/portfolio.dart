import 'package:flutter/material.dart';
import 'package:mipagina/utils/responsive.dart';
import 'package:mouse_parallax/mouse_parallax.dart';

import 'package:mipagina/utils/colores.dart';
import 'package:mipagina/utils/utils.dart';

import 'package:mipagina/strings_es.dart' as es;
import 'package:mipagina/strings_en.dart' as en;

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Responsive.isDesktop(context)
          ? EdgeInsets.only(top: 70, bottom: 70, left: 70, right: 70)
          : EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
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
                        idioma.value ? en.portfolio1 : es.portfolio1,
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
                            TextSpan(
                                text: idioma.value
                                    ? en.portfolio2
                                    : es.portfolio2),
                            TextSpan(
                              text:
                                  idioma.value ? en.portfolio3 : es.portfolio3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorTemaMenu),
                            ),
                            TextSpan(
                              text:
                                  idioma.value ? en.portfolio4 : es.portfolio4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: Responsive.isDesktop(context) ? 3 : 2,
            child: Container(
              padding: EdgeInsets.all(10),
              //color: Colors.blue,
              child: SingleChildScrollView(
                controller: controladorPortfolio,
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    BotonGaleria(
                      texto: idioma.value ? en.portfolio5 : es.portfolio5,
                      linkFoto: "assets/images/pic1.jpg",
                      description: idioma.value ? en.portfolio6 : es.portfolio6,
                    ),
                    BotonGaleria(
                      texto: idioma.value ? en.portfolio5 : es.portfolio5,
                      linkFoto: "assets/images/pic2.jpg",
                      description: idioma.value ? en.portfolio6 : es.portfolio6,
                    ),
                    BotonGaleria(
                      texto: idioma.value ? en.portfolio5 : es.portfolio5,
                      linkFoto: "assets/images/pic3.jpg",
                      description: idioma.value ? en.portfolio6 : es.portfolio6,
                    ),
                    BotonGaleria(
                      texto: idioma.value ? en.portfolio7 : es.portfolio7,
                      linkFoto: "assets/images/pic4.jpg",
                      description: idioma.value ? en.portfolio8 : es.portfolio8,
                    ),
                    BotonGaleria(
                      texto: idioma.value ? en.portfolio9 : es.portfolio9,
                      linkFoto: "assets/images/diplomaGeneXus.jpg",
                      description:
                          idioma.value ? en.portfolio10 : es.portfolio10,
                    ),
                    BotonGaleria(
                      texto: idioma.value ? en.portfolio11 : es.portfolio11,
                      linkFoto: "assets/images/diplomaCeibal.jpg",
                      description:
                          idioma.value ? en.portfolio12 : es.portfolio12,
                    ),
                    BotonGaleria(
                      texto: idioma.value ? en.portfolio13 : es.portfolio13,
                      linkFoto: "assets/images/diplomaUtu.jpg",
                      description:
                          idioma.value ? en.portfolio14 : es.portfolio14,
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

class FotoGaleria extends StatelessWidget {
  final String texto;
  final String linkFoto;
  final Size tamanio;
  const FotoGaleria(
      {Key? key,
      required this.texto,
      required this.tamanio,
      required this.linkFoto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: tamanio.height,
      width: tamanio.width,
      decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(10),
          //color: colorTemaMenu,
          ),
      child: ParallaxStack(
        layers: [
          ParallaxLayer(
            yRotation: 0.25,
            xRotation: 0,
            xOffset: 15,
            yOffset: 15,
            child: Container(
              child: Stack(
                children: [
                  Container(
                    child: Container(
                      decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(0),
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          /*colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.9), BlendMode.dstATop),*/
                          image: AssetImage(linkFoto),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: tamanio.height,
                    width: tamanio.width,
                    color: colorMenu.withOpacity(0.5),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 30,
                    right: 30,
                    child: Container(
                      width: tamanio.width,
                      height: 20,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          //color: Colors.black.withOpacity(0.0),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        texto,
                        textAlign: TextAlign.center,
                        style: fuente(1, textoGrande, 15, FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BotonGaleria extends StatelessWidget {
  final String texto;
  final String linkFoto;
  final String description;

  const BotonGaleria(
      {Key? key,
      required this.texto,
      required this.linkFoto,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        //backgroundColor: MaterialStateProperty.all(colorFondo.withOpacity(1)),
        overlayColor: MaterialStateProperty.all(
          colorTemaMenu.withOpacity(1),
        ),
        splashFactory: NoSplash.splashFactory,
      ),
      child: FotoGaleria(
        texto: texto,
        linkFoto: linkFoto,
        tamanio: Responsive.isDesktop(context)
            ? Size(MediaQuery.of(context).size.width / 6 - 40,
                MediaQuery.of(context).size.width / 6 - 55)
            : Size(MediaQuery.of(context).size.width / 3 - 50,
                MediaQuery.of(context).size.width / 3 - 50),
      ),
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (_) => AbrirConAnimacion(
            texto: texto,
            linkFoto: linkFoto,
            description: description,
          ),
        );
      },
    );
  }
}

class ImageDialog extends StatelessWidget {
  final String linkFoto;
  final String description;
  const ImageDialog(
      {Key? key, required this.linkFoto, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Responsive.isDesktop(context) ? 215 : 0),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Stack(
          children: [
            Container(
              width: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width / 2
                  : MediaQuery.of(context).size.width - 20,
              height: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.height -
                      MediaQuery.of(context).size.height / 4
                  : MediaQuery.of(context).size.height - 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(linkFoto), fit: BoxFit.contain)),
            ),
            Positioned(
              bottom: Responsive.isDesktop(context) ? 100 : 10,
              left: Responsive.isDesktop(context) ? 80 : 10,
              right: Responsive.isDesktop(context) ? 80 : 10,
              child: Container(
                height: Responsive.isDesktop(context) ? 100 : 170,
                decoration: BoxDecoration(
                  color: colorMenu.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    description,
                    style: fuente(1, Colors.white, 18, FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AbrirConAnimacion extends StatefulWidget {
  final String texto;
  final String linkFoto;
  final String description;

  const AbrirConAnimacion(
      {Key? key,
      required this.texto,
      required this.linkFoto,
      required this.description})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => AbrirConAnimacionState(
      texto: texto, description: description, linkFoto: linkFoto);
}

class AbrirConAnimacionState extends State<AbrirConAnimacion>
    with SingleTickerProviderStateMixin {
  final String texto;
  final String linkFoto;
  final String description;

  AbrirConAnimacionState(
      {required this.texto, required this.linkFoto, required this.description});
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 550));
    scaleAnimation = CurvedAnimation(
        parent: controller, curve: Curves.fastLinearToSlowEaseIn);

    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: ImageDialog(linkFoto: linkFoto, description: description),
          ),
        ),
      ),
    );
  }
}
