import 'package:countries/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../models/country_details.dart';
import '../schemas/data_source.dart';
import '../schemas/get_country_details_schema.dart';

class GetCounryDetailsProvider extends ChangeNotifier {
  String _errorMessage = "";

  bool _showMore = true;

  CountryDetails _country = CountryDetails.empty();

  String get getErrorMessage => _errorMessage;
  bool get showMore => _showMore;

  final DataSource _dataSourse = DataSource();

  void getCountryDetails(String code) async {
    _showMore = true;
    _errorMessage = "";
    _country = CountryDetails.empty();
    ValueNotifier<GraphQLClient> _client = _dataSourse.getClient();
    QueryResult result = await _client.value.query(
      QueryOptions(
          document: gql(GetCountryDetailsSchema.countryDetailsJson
              .replaceFirst("\$code", code)),
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
        _country = CountryDetails.empty();
      } else {
        _country = CountryDetails.fromJson(result.data!["country"]);
      }
      notifyListeners();
    }
  }

  CountryDetails getCountry() {
    return _country;
  }

  void updateShowButtonState() {
    _showMore = !_showMore;
    notifyListeners();
  }
}
