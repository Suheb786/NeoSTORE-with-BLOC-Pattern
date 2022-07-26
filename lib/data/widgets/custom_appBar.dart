import 'package:flutter/material.dart';
import 'package:neostorewithbloc/data/widgets/custom_text.dart';

AppBar customAppBar(
    {required String text,
    double size = 16,
    Widget? leading,
    List<Widget>? action}) {
  return AppBar(
    actions: action,
    leading: leading,
    backgroundColor: Colors.red[800],
    elevation: 0,
    toolbarHeight: 35,
    centerTitle: true,
    title: CustomText(
      text: text,
      size: size,
      fontName: "GothamBold",
    ),
  );
}
