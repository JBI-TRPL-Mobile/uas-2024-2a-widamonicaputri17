import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_project/providers/app_state.dart';
import 'package:template_project/screens/sign_in_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Column(
        children: [
          Text('Name: ${appState.name}'),
          Text('Email: ${appState.email}'),
          ElevatedButton(
            onPressed: () {
              Provider.of<AppState>(context, listen: false).logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
            child: Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
