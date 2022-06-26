import 'dart:convert';

import 'package:countries/models/country.dart';
import 'package:countries/schemas/get_countries_schema.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../schemas/data_source.dart';

class GetCounriesProvider extends ChangeNotifier {
  String _response = '';

  List<Country> _countries = [];

  String get getResponse => _response;

  final DataSource _dataSourse = DataSource();

  void getCountries() async {
    ValueNotifier<GraphQLClient> _client = _dataSourse.getClient();

    QueryResult result = await _client.value.query(QueryOptions(
        document: gql(GetCountriesSchema.getCountriesJson),
        fetchPolicy: FetchPolicy.networkOnly));

    if (result.hasException) {
      if (result.exception!.graphqlErrors.isEmpty) {
        _response = "Internet is not found";
      } else {
        _response = result.exception!.graphqlErrors[0].message.toString();
      }
      notifyListeners();
    } else {
      if (result.data == null) {
        _countries = [];
      } else {
        _countries = List<Country>.from(result.data!['countries']
            .map((country) => Country.fromJson(country)));
      }
      notifyListeners();
    }
  }

  String getCountryFlag(int index) {
    var country = _countries[index];
    return country.emoji;
  }

  String getCountryName(int index) {
    var country = _countries[index];
    return country.name;
  }

  String getCountryCode(int index) {
    var country = _countries[index];
    return country.code;
  }

  int getLenght() {
    return _countries.length;
  }

  void clear() {
    _response = '';
    notifyListeners();
  }
}
