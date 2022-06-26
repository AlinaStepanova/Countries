import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../models/country_details.dart';
import '../schemas/data_source.dart';
import '../schemas/get_country_details_schema.dart';

class GetCounryDetailsProvider extends ChangeNotifier {
  String _response = '';

  CountryDetails? _country;

  String get getResponse => _response;

  final DataSource _dataSourse = DataSource();

  void getCountryDetails(String code) async {
    ValueNotifier<GraphQLClient> _client = _dataSourse.getClient();
    QueryResult result = await _client.value.query(QueryOptions(
        document: gql(GetCountryDetailsSchema.countryDetailsJson
            .replaceFirst("\$code", code)),
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
        _country = null;
      } else {
        _country = CountryDetails.fromJson(result.data!["country"]);
      }
      notifyListeners();
    }
  }

  CountryDetails? getCountry() {
    return _country;
  }

  void clear() {
    _response = '';
    notifyListeners();
  }
}
