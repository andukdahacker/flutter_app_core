import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

Client initFerryClient() {
  final httpLink = HttpLink('http:localhost:4000/graphql');

  final client = Client(link: httpLink);

  return client;
}
