import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SnackBars {
  SnackBar successSnackBar({
    required BuildContext context,
    required String text,
  }) {
    return SnackBar(
        content: Text(
      text,
      style: Theme.of(context).textTheme.headline5,
    ));
  }

  SnackBar errorSnackBar(BuildContext context) {
    return SnackBar(
        content: Text(
      "Login failed",
      style: Theme.of(context).textTheme.headline5,
    ));
  }
}
