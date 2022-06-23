import 'package:countries/schemas/get_countries_schema.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../schemas/data_source.dart';

class GetCounriesProvider extends ChangeNotifier {
  String _response = '';

  dynamic _countries = [];

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
      _countries = result.data;
      notifyListeners();
    }
  }

  dynamic getResponseData() {
    if (_countries.isNotEmpty) {
      final data = _countries;

      print(data['countries']);

      return data['countries'] ?? {};
    } else {
      return {};
    }
  }

  void clear() {
    _response = '';
    notifyListeners();
  }
}
