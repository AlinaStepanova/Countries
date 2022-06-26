import 'package:countries/ui/country_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/get_countries_provider.dart';
import '../utils/utils.dart';
import 'widgets/country_list_item.dart';

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
      backgroundColor: Colors.white,
      body: Consumer<GetCounriesProvider>(
        builder: (context, provider, child) {
          return ListView(
              children: List.generate(provider.getLenght(), (index) {
            return CountryListItem(
              provider.getCountryFlag(index),
              provider.getCountryName(index),
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountryDetailPage(
                      code: provider.getCountryCode(index),
                      name: provider.getCountryName(index)),
                ),
              ),
            );
          }));
        },
      ),
    );
  }
}
