import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import 'storage_key.dart';

@LazySingleton()
class SecureStorageManager {
  SecureStorageManager(this._flutterSecureStorage);

  final FlutterSecureStorage _flutterSecureStorage;

  final androidOptions = const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  final iOSOptions = const IOSOptions(
    accessibility: KeychainAccessibility.unlocked_this_device,
    synchronizable: true,
  );

  FutureOr<void> write(LocalStorageKey key, String value) =>
      _flutterSecureStorage.write(
        key: key.name,
        value: value,
        aOptions: androidOptions,
        iOptions: iOSOptions,
      );

  Future<String?> read(LocalStorageKey key) => _flutterSecureStorage.read(
        key: key.name,
        aOptions: androidOptions,
        iOptions: iOSOptions,
      );

  Future<void> delete(LocalStorageKey key) => _flutterSecureStorage.delete(
        key: key.name,
        aOptions: androidOptions,
        iOptions: iOSOptions,
      );

  Future<void> deleteAll() => _flutterSecureStorage.deleteAll(
        aOptions: androidOptions,
        iOptions: iOSOptions,
      );

  Future<Map<String, String>> readAll() => _flutterSecureStorage.readAll(
        aOptions: androidOptions,
        iOptions: iOSOptions,
      );
}
