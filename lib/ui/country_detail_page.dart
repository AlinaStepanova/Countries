import 'package:flutter/material.dart';

class CountryDetailPage extends StatefulWidget {
  const CountryDetailPage({Key? key, required this.code, required this.name})
      : super(key: key);

  final String code;
  final String name;

  @override
  State<CountryDetailPage> createState() => _CountryDetailPageState();
}

class _CountryDetailPageState extends State<CountryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(widget.code),
      ),
    );
  }
}
