/*

SERVICES
  - readFromStorage
  - writeToStorage
  - checkFirstRun
Interfaces / Dependencies
  - Repository
    - [Hive]

*/

import 'package:client_app/providers/first_run/repo/hive/adapter.dart';
import 'package:client_app/providers/first_run/repo/port.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

const _boxName = "firstRunBox";

class FirstRunProvider extends ChangeNotifier {
  // Flag
  bool? _isFirstRun;
  bool? get isFirstRun => _isFirstRun;
  set isFirstRun(bool? v) {
    _isFirstRun = v;
    notifyListeners();
  }

  // Functions
  void writeToStorage() {
    _repo.storeFirstRunStatus();
  }

  void _checkFirstRun() {
    // read from storage
    if (_repo.readFirstRunStatus() != null) {
      isFirstRun = false;
    } else {
      isFirstRun = true;
    }
  }

  // Repo general
  late Port _repo;

  // Repo [Hive]
  late Box _box;

  Future<void> _openBox() async {
    _box = await Hive.openBox(_boxName);
  }

  FirstRunProvider() {
    _openBox().then((value) {
      // Construct repo
      _repo = HiveAdapter(box: _box);
      // Check first run
      _checkFirstRun();
    });
  }
}
