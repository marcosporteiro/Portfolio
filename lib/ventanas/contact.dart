import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../utils/colores.dart';
import '../utils/utils.dart';
import '../utils/responsive.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

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
                        "CONTACTO",
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
                            TextSpan(text: "Como puedes "),
                            TextSpan(
                              text: "contactar",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorTemaMenu),
                            ),
                            TextSpan(
                              text: " conmigo",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Mails(),
                    Flex(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      direction: isWideScreen(
                              MediaQuery.of(context).size.height,
                              MediaQuery.of(context).size.width)
                          ? Axis.horizontal
                          : Axis.vertical,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "TELÉFONO",
                                style:
                                    fuente(1, colorMenu, 25, FontWeight.bold),
                              ),
                              SelectableText(
                                "\n(+598) 98 431 331",
                                style: fuente(2, Colors.black.withOpacity(1),
                                    18, FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                          child: Column(
                            children: [
                              Text(
                                "CORREO",
                                style:
                                    fuente(1, colorMenu, 25, FontWeight.bold),
                              ),
                              SelectableText(
                                "\nmipoteiro@hotmail.com",
                                style: fuente(2, Colors.black.withOpacity(1),
                                    18, FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                      ],
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

class Mails extends StatelessWidget {
  final emailController = TextEditingController();
  final mensajeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Mails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height / 2,
      //color: Colors.black,
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.height / 2,
              padding: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
              child: TextFormField(
                cursorColor: colorTemaMenu,
                controller: emailController,
                textInputAction: TextInputAction.next,
                autofillHints: [AutofillHints.email],
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? "Email invalido"
                        : null,
                decoration: InputDecoration(
                  labelText: "Mail",
                  hintText: "nombre@ejemplo.com",
                  labelStyle: fuente(
                      1, Colors.black.withOpacity(1), 18, FontWeight.w300),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorTemaMenu),
                  ),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: colorTemaMenu),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.height / 2,
              child: TextFormField(
                maxLines: 5,
                controller: mensajeController,
                validator: (mensaje) => mensaje != null && mensaje != ""
                    ? null
                    : "Ingrese un mensaje",
                cursorColor: colorTemaMenu,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Su mensaje",
                  contentPadding: EdgeInsets.all(20),
                  isDense: true,
                  labelStyle: fuente(
                      1, Colors.black.withOpacity(1), 18, FontWeight.w300),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorTemaMenu),
                  ),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: colorTemaMenu),
                  ),
                ),
                //keyboardType: TextInputType.multiline,
              ),
            ),
            Container(
              //boton
              height: 75,
              width: 200,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: colorTemaMenu.withOpacity(1),
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                    Colors.black.withOpacity(0.1),
                  ),
                  splashFactory: NoSplash.splashFactory,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                child: Container(
                  child: Container(
                    child: Center(
                      child: Text(
                        "Enviar",
                        textAlign: TextAlign.center,
                        style: fuente(1, Colors.white, 20, FontWeight.w300),
                      ),
                    ),
                  ),
                ),
                onPressed: () async {
                  final form = formKey.currentState;

                  if (form!.validate()) {
                    final email = emailController.text;
                    final mensaje = mensajeController.text;
                    print(email);
                    print(mensaje);

                    //sendMail(email, mensaje, context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
Future<void> sendMail(
    String email, String mensaje, BuildContext context) async {
  String usuario = "miporteiropw@gmail.com";
  String contra = "53830860";

  final smtpServer = gmail(usuario, contra);
  final msj = Message()
    ..from = Address(usuario)
    ..recipients.add("miporteiro@hotmail.com")
    ..subject = "Mensaje de: ${email} desde portfolio."
    ..html = mensaje;

  try {
    final SendReport = await send(msj, smtpServer);
    print("\nMensaje enviado.\n");
    showToast("Mensaje enviado.",
        context: context,
        backgroundColor: Colors.green,
        position:
            StyledToastPosition(align: Alignment.bottomRight, offset: 45));
  } on MailerException catch (e) {
    print("\nEl mensaje no se pudo enviar.\n" + e.toString());
    showToast("El mensaje no se pudo enviar.",
        context: context,
        backgroundColor: Colors.red,
        position:
            StyledToastPosition(align: Alignment.bottomRight, offset: 45));
  }
}*/
