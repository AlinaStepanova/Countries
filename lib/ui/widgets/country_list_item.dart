import 'package:flutter/material.dart';

class CountryListItem extends StatelessWidget {
  final String name;
  final String icon;
  final Function onClick;

  const CountryListItem(
    this.name,
    this.icon,
    this.onClick, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        name,
        style: const TextStyle(fontSize: 24),
      ),
      title: Text(
        icon,
        style: const TextStyle(fontSize: 18),
      ),
      trailing: Icon(
        Icons.adaptive.arrow_forward_outlined,
      ),
      onTap: () {
        () => onClick();
      },
    );
  }
}
