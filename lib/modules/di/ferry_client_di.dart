import 'package:ferry/ferry.dart';
import 'package:injectable/injectable.dart';

import '../graphql/ferry_client.dart';

@module
abstract class FerryClientInjection {
  Client ferry() => initFerryClient();
}
