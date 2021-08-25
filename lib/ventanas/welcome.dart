import 'package:flutter/material.dart';
import 'package:mipagina/ventanas/consola.dart';

class AbrirWelcome extends StatefulWidget {
  const AbrirWelcome({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => AbrirWelcomeAnimado();
}

class AbrirWelcomeAnimado extends State<AbrirWelcome>
    with SingleTickerProviderStateMixin {
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
    return MiConsola();
  }
}

void abrirConsola(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AbrirWelcome(),
  );
}
