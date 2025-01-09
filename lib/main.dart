import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_project/providers/app_providers.dart';
import 'screens/home_screen.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Wireframe App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
      routes: {
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}
