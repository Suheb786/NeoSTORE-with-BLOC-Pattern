import 'package:flutter/material.dart';

Center ProgressingIndicator() {
  return Center(
      child: Container(
    width: 100,
    child: LinearProgressIndicator(
      backgroundColor: Colors.white,
      color: Colors.red.shade900,
    ),
  ));
}
