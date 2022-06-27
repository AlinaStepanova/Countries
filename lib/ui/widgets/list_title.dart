import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: const TextStyle(fontSize: 18));
  }
}
