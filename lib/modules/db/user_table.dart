import 'package:drift/drift.dart';

class UserTable extends Table {
  TextColumn get id => text().named('id')();
  TextColumn get username => text().named('username')();
  TextColumn get email => text().named('email')();
  BoolColumn get isVerified => boolean().named('isVerified')();
  TextColumn get avatar => text().nullable().named('avatar')();
}
