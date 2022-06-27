import 'package:countries/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DataSource {
  static final DataSource _dataSource = DataSource._internal();
  DataSource._internal();
  factory DataSource() {
    return _dataSource;
  }

  ValueNotifier<GraphQLClient> getClient() {
    ValueNotifier<GraphQLClient> _client = ValueNotifier(
      GraphQLClient(
        link: HttpLink(baseUrl),
        cache: GraphQLCache(store: HiveStore()),
      ),
    );

    return _client;
  }
}
