// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

  int? maxLines;
  String? fontName;
  TextOverflow? overflow;
  Color? color;
  double? size;
  String text;
  CustomText({
    this.maxLines,
    this.overflow,
    this.color = Colors.white,
    required this.text,
    this.size,
    this.fontName = "GothamMedium",
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      overflow: overflow,
      text,
      style: TextStyle(
        fontFamily: fontName,
        color: color,
        fontSize: size,
      ),
    );
  }
}
