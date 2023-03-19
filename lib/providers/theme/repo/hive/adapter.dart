import 'package:flutter/src/material/app.dart';
import 'package:hive/hive.dart';
import 'package:client_app/providers/theme/repo/port.dart';

class HiveAdapter implements Port {
  late Box _box;

  @override
  ThemeMode? readThemeMode() {
    return _box.get('flag');
  }

  @override
  String? storeThemeMode({required ThemeMode mode}) {
    _box.put('flag', mode);
    throw UnimplementedError();
  }

  @override
  Future<void> clearStorage() async {
    await _box.clear();
    throw UnimplementedError();
  }

  HiveAdapter({required Box box}) {
    _box = box;
  }
}
