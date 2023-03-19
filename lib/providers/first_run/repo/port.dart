import 'dart:ffi';

abstract class Port {
  String? storeFirstRunStatus() {}
  bool? readFirstRunStatus() {}

  Future<void> clearStorage() async {}
}
