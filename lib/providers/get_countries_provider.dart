import 'package:countries/models/country.dart';
import 'package:countries/schemas/get_countries_schema.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../schemas/data_source.dart';
import '../utils/utils.dart';

class GetCounriesProvider extends ChangeNotifier {
  String _errorMessage = "";

  List<Country> _countries = [];

  String get getErrorMessage => _errorMessage;

  final DataSource _dataSourse = DataSource();

  void getCountries() async {
    ValueNotifier<GraphQLClient> _client = _dataSourse.getClient();

    QueryResult result = await _client.value.query(
      QueryOptions(
          document: gql(GetCountriesSchema.getCountriesJson),
          fetchPolicy: FetchPolicy.networkOnly),
    );

    if (result.hasException) {
      if (result.exception!.graphqlErrors.isEmpty) {
        _errorMessage = internetConnectionErrorText;
      } else {
        _errorMessage = result.exception!.graphqlErrors[0].message.toString();
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
    var flag = "";
    if (_countries.isNotEmpty) {
      var country = _countries[index];
      flag = country.emoji;
    }
    return flag;
  }

  String getCountryName(int index) {
    var name = "";
    if (_countries.isNotEmpty) {
      var country = _countries[index];
      name = country.name;
    }
    return name;
  }

  String getCountryCode(int index) {
    var code = "";
    if (_countries.isNotEmpty) {
      var country = _countries[index];
      code = country.code;
    }
    return code;
  }

  int getLenght() {
    return _countries.length;
  }
}
