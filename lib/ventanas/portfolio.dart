import 'package:flutter/material.dart';
import 'package:mipagina/utils/responsive.dart';
import 'package:mouse_parallax/mouse_parallax.dart';

import '../utils/colores.dart';
import '../utils/utils.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

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
                        "PORTFOLIO",
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
                            TextSpan(text: "Algunos de mis "),
                            TextSpan(
                              text: "proyectos",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorTemaMenu),
                            ),
                            TextSpan(
                              text:
                                  " que realicé mientras estudiaba o por mi cuenta",
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
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(10),
              //color: Colors.blue,
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    BotonGaleria(
                      texto: "GESTAMBO - UTU",
                      linkFoto: "assets/images/pic1.jpg",
                    ),
                    BotonGaleria(
                      texto: "GESTAMBO - UTU",
                      linkFoto: "assets/images/pic2.jpg",
                    ),
                    BotonGaleria(
                      texto: "GESTAMBO - UTU",
                      linkFoto: "assets/images/pic3.jpg",
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
      child: Stack(
        children: [
          Container(
            child: Container(
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(0),
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.9), BlendMode.dstATop),
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
    );
  }
}

class BotonGaleria extends StatelessWidget {
  final String texto;
  final String linkFoto;

  const BotonGaleria({Key? key, required this.texto, required this.linkFoto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        //backgroundColor: MaterialStateProperty.all(colorFondo.withOpacity(1)),
        overlayColor: MaterialStateProperty.all(
          Colors.black.withOpacity(0.6),
        ),
        splashFactory: NoSplash.splashFactory,
      ),
      child: FotoGaleria(
        texto: texto,
        linkFoto: linkFoto,
        tamanio: Responsive.isDesktop(context)
            ? Size(MediaQuery.of(context).size.width / 5,
                MediaQuery.of(context).size.width / 5)
            : Size(MediaQuery.of(context).size.width / 2,
                MediaQuery.of(context).size.width / 2),
      ),
      onPressed: () async {
        await showDialog(
            context: context, builder: (_) => ImageDialog(linkFoto: linkFoto));
      },
    );
  }
}

class ImageDialog extends StatelessWidget {
  final String linkFoto;
  const ImageDialog({Key? key, required this.linkFoto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Responsive.isDesktop(context) ? 215 : 0),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 100,
        child: Container(
          width: MediaQuery.of(context).size.width -
              MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).size.height / 2.5,
          child: Container(
            width: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width / 2.5,
            height: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(linkFoto), fit: BoxFit.contain)),
          ),
        ),
      ),
    );
  }
}
