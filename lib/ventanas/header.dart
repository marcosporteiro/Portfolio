import 'package:flutter/cupertino.dart';

class header extends StatelessWidget {
  const header({
    Key? key,
    required this.elwid,
    required this.decoracion,
  }) : super(key: key);

  final BoxDecoration decoracion;
  final Widget elwid;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(minWidth: 1000, minHeight: 1000),
      decoration: decoracion,
      child: this.elwid,
    );
  }
}
