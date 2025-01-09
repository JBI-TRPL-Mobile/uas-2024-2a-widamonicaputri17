import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        itemCount: 10, // Ganti jumlah sesuai kebutuhan
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                title: Text(
                  "Sender ${index + 1}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("This is a message preview..."),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
