import 'package:client_app/screens/app/app.dart';
import "package:flutter/material.dart";
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../models/user/user.dart';
import '../../screens/auth/auth.dart';

enum AuthLoading {
  autologin,
  authenticating,
  logout,
  updateProfile,
  changePhone,
  fetchUser,
}

class AuthProvider extends ChangeNotifier {
  // Loading
  AuthLoading? _loading = AuthLoading.autologin;
  AuthLoading? _authenticating = AuthLoading.authenticating;

  AuthLoading? get authenticating => _authenticating;
  set Authenticating(AuthLoading? authenticating) {
    // Future<Map<String, dynamic>> register(String email, String password) async {
    //   final Map<String, dynamic> loginData = {
    //     "user": {'email': email, "password": password}
    //   };
    // }

    _authenticating = AuthLoading.authenticating;
    notifyListeners();

    // Response response = awit post(
    //   body:json.encode(loginData),
    //   headers:{})
    //   .then(onValue)
    //   .catchError(onError);
  }

  AuthLoading? get loading => _loading;
  set loading(AuthLoading? loading) {
    _loading = loading;
    notifyListeners();
  }

  // Error
  String? _error;
  String? get error => _error;
  set error(String? error) {
    _error = error;
    notifyListeners();
  }

  // Token
  String? _token;
  String? get token => _token;
  set token(String? token) {
    _token = token;
    notifyListeners();
  }

  // User
  User? _user;
  User? get user => _user;
  set user(User? user) {
    _user = user;
    notifyListeners();
  }
}
