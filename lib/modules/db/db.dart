import 'package:drift/drift.dart';

import 'connection/connection.dart' as impl;
import 'user_table.dart';

part 'db.g.dart';

@DriftDatabase(tables: [UserTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase(): super(impl.connect());
  @override
  int get schemaVersion => 1;
}
