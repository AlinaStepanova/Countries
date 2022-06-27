import 'package:flutter/material.dart';

import 'list_title.dart';

class CountryListItem extends StatelessWidget {
  final String icon;
  final String name;
  final Function onClick;

  const CountryListItem(
    this.icon,
    this.name,
    this.onClick, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        icon,
        style: const TextStyle(fontSize: 24),
      ),
      title: ListTitle(title: name),
      trailing: Icon(
        Icons.adaptive.arrow_forward_outlined,
      ),
      onTap: () => onClick(),
    );
  }
}
