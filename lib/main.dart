import 'package:flutter/material.dart';
import 'pages/screen1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Listings App',
      home: Screen1(), // Starts directly on Screen 1 (left VIP screen)
    );
  }
}
