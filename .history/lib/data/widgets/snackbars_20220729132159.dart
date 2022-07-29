import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SnackBars {
  SnackBar successSnackBar(BuildContext context) {
    return SnackBar(
        content: Text(
      "Login failed",
      style: Theme.of(context).textTheme.headline5,
    ));
  }
}
