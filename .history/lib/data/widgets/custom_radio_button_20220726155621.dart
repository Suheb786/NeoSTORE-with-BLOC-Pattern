import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final dynamic value;
  final dynamic groupValue;
  final void Function(dynamic)? onChanged;
  final String title;
  const CustomRadioButton({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile(
        activeColor: Theme.of(context).colorScheme.secondary,
        dense: true,

        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Text(title, style: Theme.of(context).textTheme.headline5),
        //  visualDensity: VisualDensity.compact,
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
