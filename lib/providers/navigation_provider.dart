import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  String _currentPage = "Dashboard";

  String get currentPage => _currentPage;

  void navigateTo(String page) {
    _currentPage = page;
    notifyListeners();
  }
}
