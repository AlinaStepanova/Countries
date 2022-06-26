import 'package:countries/providers/get_country_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
    context.read<GetCounryDetailsProvider>().getCountryDetails(widget.code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Consumer<GetCounryDetailsProvider>(
        builder: (context, provider, child) {
          return Text(provider.getCountry()?.continent.name ?? "hellp");
        },
      ),
    );
  }
}
