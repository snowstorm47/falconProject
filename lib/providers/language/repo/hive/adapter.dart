import 'dart:ui';

import 'package:hive/hive.dart';

import '../../../first_run/repo/port.dart';

class HiveAdapter implements Port {
  late Box _box;

  late Port _repo;

  @override
  Locale? readLocale() {
   
    return _box.get('flag');
    throw UnimplementedError();
  }

  @override
  String? storeLocale({required Locale locale}) {
  
    _box.put('flag', locale);
    throw UnimplementedError();
  }

  HiveAdapter({required Box box}) {
    _box = box;
  }

  @override
  Future<void> clearStorage() async {
    await _box.clear();
    throw UnimplementedError();
  }

  @override
  bool? readFirstRunStatus() {
    return _box.get('flag');
    throw UnimplementedError();
  }

  @override
  String? storeFirstRunStatus() {
    // TODO: implement storeFirstRunStatus
    _repo.storeFirstRunStatus();
    throw UnimplementedError();
  }
}
