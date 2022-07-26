import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    MaterialButton(
      color: Colors.blue,
      onPressed: ()=> this.controller.function(),
      splashColor: Colors.blueGrey,
      child: Text('OK',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    ),);
  }
}