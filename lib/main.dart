import 'package:flutter/material.dart';
import 'package:new_proj/pages/buyerdashboard/buyer_dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Listings App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),
      home: const BuyerDashboardScaffold(initialIndex: 0), // Starts on Home (VIP cars)
    );
  }
}
