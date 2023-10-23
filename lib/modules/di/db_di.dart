import 'package:injectable/injectable.dart';

import '../db/db.dart';

@module
abstract class DatabaseInjection {
  @singleton
  AppDatabase db() => AppDatabase();
}
