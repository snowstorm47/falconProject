import 'package:client_app/providers/first_run/repo/port.dart';
import 'package:hive/hive.dart';

const boxName = 'first_run';

class HiveAdapter implements Port {
  late Box _box;

  @override
  bool? readFirstRunStatus() {
    return !!_box.get("flag");
  }

  @override
  String? storeFirstRunStatus() {
    _box.put("flag", true);
    return null;
  }

  @override
  Future<void> clearStorage() async {
    await _box.clear();
  }

  HiveAdapter({required Box box}) {
    _box = box;
  }
}
