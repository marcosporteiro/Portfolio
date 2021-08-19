import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:http/http.dart' as http;

import 'package:mipagina/utils/colores.dart';
import 'package:mipagina/utils/utils.dart';
import 'package:mipagina/utils/responsive.dart';

import 'package:mipagina/strings_es.dart' as es;
import 'package:mipagina/strings_en.dart' as en;

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
                        ingles ? en.contacto1 : es.contacto1,
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
                                text: ingles ? en.contacto2 : es.contacto2),
                            TextSpan(
                              text: ingles ? en.contacto3 : es.contacto3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorTemaMenu),
                            ),
                            TextSpan(
                              text: ingles ? en.contacto4 : es.contacto4,
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
                                ingles ? en.contacto5 : es.contacto5,
                                style:
                                    fuente(1, colorMenu, 25, FontWeight.bold),
                              ),
                              SelectableText(
                                ingles ? en.contacto6 : es.contacto6,
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
                                ingles ? en.contacto7 : es.contacto7,
                                style:
                                    fuente(1, colorMenu, 25, FontWeight.bold),
                              ),
                              SelectableText(
                                ingles ? en.contacto8 : es.contacto8,
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
  static final emailController = TextEditingController();
  static final mensajeController = TextEditingController();
  static final formKey = GlobalKey<FormState>();

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
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? ingles
                            ? en.contacto9
                            : es.contacto9
                        : null,
                decoration: InputDecoration(
                  labelText: ingles ? en.contacto10 : es.contacto10,
                  hintText: ingles ? en.contacto11 : es.contacto11,
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
                    : ingles
                        ? en.contacto12
                        : es.contacto12,
                cursorColor: colorTemaMenu,
                decoration: InputDecoration(
                  hintText: ingles ? en.contacto13 : es.contacto13,
                  contentPadding: EdgeInsets.all(10),
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
                        ingles ? en.contacto14 : es.contacto14,
                        textAlign: TextAlign.center,
                        style: fuente(1, Colors.white, 20, FontWeight.w300),
                      ),
                    ),
                  ),
                ),
                onPressed: () async {
                  if (!botonClikeado) {
                    final form = formKey.currentState;
                    if (form!.validate()) {
                      final email = emailController.text;
                      final mensaje = mensajeController.text;
                      try {
                        // print(email);
                        // print(mensaje);
                        showToast(ingles ? en.contacto15 : es.contacto15,
                            context: context,
                            duration: Duration(seconds: 8),
                            backgroundColor: Colors.amber,
                            position: StyledToastPosition(
                                align: Alignment.bottomRight, offset: 45));
                        await sendEmail(subject: email, message: mensaje);
                        showToast(ingles ? en.contacto16 : es.contacto16,
                            context: context,
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 4),
                            position: StyledToastPosition(
                                align: Alignment.bottomRight, offset: 45));
                        botonClikeado = true;
                      } catch (e) {
                        showToast(
                            ingles
                                ? en.contacto17
                                : es.contacto17 + e.toString(),
                            context: context,
                            duration: Duration(seconds: 4),
                            backgroundColor: Colors.red,
                            position: StyledToastPosition(
                                align: Alignment.bottomRight, offset: 45));
                      }
                    }
                  } else {
                    showToast(ingles ? en.contacto18 : es.contacto18,
                        context: context,
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                        position: StyledToastPosition(
                            align: Alignment.bottomRight, offset: 45));
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

Future sendEmail({
  required String subject,
  required String message,
}) async {
  final serviceId = 'service_yv6gpsn';
  final templateId = 'template_ncn0ag9';
  final userId = 'user_a0k5WKADc1fyFVg4FEilf';

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  // ignore: unused_local_variable
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'template_params': {
        'user_subject': subject,
        'user_message': message,
      },
    }),
  );
}
