import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/get_countries_provider.dart';
import '../utils/utils.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  @override
  void initState() {
    super.initState();
    context.read<GetCounriesProvider>().getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(countriesTitle),
      ),
      body: Consumer<GetCounriesProvider>(
        builder: (context, provider, child) {
          var countries = provider.getResponseData();
          return ListView(
              children: List.generate(countries.length, (index) {
            final data = countries[index];
            return Text(data['name']);
          }));
        },
      ),
    );
  }
}
