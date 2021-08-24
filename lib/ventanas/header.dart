import 'package:flutter/material.dart';
import 'package:mipagina/utils/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.elwid,
    required this.decoracion,
    required this.item,
  }) : super(key: key);

  final BoxDecoration decoracion;
  final Widget elwid;
  final int item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Responsive.isDesktop(context)
          ? EdgeInsets.only(
              left: (item != 0) ? 70 : 0,
              right: (item != 0) ? 70 : 0,
              top: (item == 1) ? 70 : 0,
              bottom: (item == 4) ? 70 : 0,
            )
          : EdgeInsets.only(
              top: (item == 1) ? 70 : 0,
              bottom: (item == 4) ? 10 : 0,
            ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(minWidth: 1000, minHeight: 1000),
      child: Container(decoration: decoracion, child: this.elwid),
    );
  }
}
