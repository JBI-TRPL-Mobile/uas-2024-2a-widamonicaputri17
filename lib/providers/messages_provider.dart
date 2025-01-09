import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Message {
  final int id;
  final String title;
  final String content;

  Message({required this.id, required this.title, required this.content});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      title: json['title'],
      content: json['content'],
    );
  }
}

class MessageProvider with ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => _messages;

  Future<void> loadMessages() async {
    final String response =
        await rootBundle.loadString('assets/datamessage.json');
    final List<dynamic> data = json.decode(response);
    _messages = data.map((item) => Message.fromJson(item)).toList();
    notifyListeners();
  }
}
