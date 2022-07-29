import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SnackBars {
  BuildContext context;

  SnackBar successSnackBar() => const SnackBar(content: Text("Login failed", style: Theme.of(context).textTheme.headline5,));
}
