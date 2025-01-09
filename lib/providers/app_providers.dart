import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template_project/models/message_model.dart';
import 'package:template_project/models/user_model.dart';

class AppProvider with ChangeNotifier {
  List<MessageModel> _messages = [];
  List<UserModel> _users = [];

  List<MessageModel> get messages => _messages;
  List<UserModel> get users => _users;

  // Fungsi untuk memuat pesan dari file JSON
  Future<void> loadMessages() async {
    try {
      final data = await rootBundle.loadString('assets/message_data.json');
      final jsonResult = json.decode(data) as List;
      _messages = jsonResult.map((e) => MessageModel.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      debugPrint("Error loading messages: $e");
    }
  }

  // Fungsi untuk memuat pengguna dari file JSON
  Future<void> loadUsers() async {
    try {
      final data = await rootBundle.loadString('assets/user_data.json');
      final jsonResult = json.decode(data) as List;
      _users = jsonResult.map((e) => UserModel.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      debugPrint("Error loading users: $e");
    }
  }
}
