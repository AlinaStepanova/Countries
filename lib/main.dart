import 'package:countries/providers/get_countries_provider.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import 'ui/countries_page.dart';
import 'utils/utils.dart';

void main() async {
  await initHiveForFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetCounriesProvider()),
      ],
      child: MaterialApp(
        title: countriesTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CountriesPage(),
      ),
    );
  }
}
