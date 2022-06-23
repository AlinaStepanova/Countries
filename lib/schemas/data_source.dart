import 'package:countries/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DataSource {
  ValueNotifier<GraphQLClient> getClient() {
    ValueNotifier<GraphQLClient> _client = ValueNotifier(GraphQLClient(
      link: HttpLink(baseUrl),
      cache: GraphQLCache(store: HiveStore()),
    ));

    return _client;
  }
}
