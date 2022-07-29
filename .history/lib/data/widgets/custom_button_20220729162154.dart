// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final double horizontalPadding;
  final double verticalPadding;

  void Function()? navigation;

  final String text;
  CustomButton({
    this.verticalPadding = 0,
    this.horizontalPadding = 30.0,
    this.navigation,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigation,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding, vertical: verticalPadding),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          // width: MediaQuery.of(context).size.width - 20,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: backgroundColor,
          ),
          child: Center(
              child: Text(text,
                  style: TextStyle(
                      fontFamily: "GothamBold",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor))),
        ),
      ),
    );
  }
}
