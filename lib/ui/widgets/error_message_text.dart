import 'package:flutter/material.dart';

class ErrowMessageText extends StatelessWidget {
  const ErrowMessageText(
    this.message, {
    Key? key,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Text(message),
        alignment: Alignment.topCenter);
  }
}
