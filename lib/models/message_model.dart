class MessageModel {
  final String id;
  final String title;
  final String body;

  MessageModel({required this.id, required this.title, required this.body});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  get content => null;
}
