import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  String? _email;
  String? _name;

  String? get email => _email;
  String? get name => _name;

  void login(String email, String name) {
    _email = email;
    _name = name;
    notifyListeners();
  }

  void logout() {
    _email = null;
    _name = null;
    notifyListeners();
  }
}
