import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

class UserProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  Future<void> loadUsers() async {
    final String response = await rootBundle.loadString('assets/datauser.json');
    final List<dynamic> data = json.decode(response);
    _users = data.map((item) => User.fromJson(item)).toList();
    notifyListeners();
  }
}
