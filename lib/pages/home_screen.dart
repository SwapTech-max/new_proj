import 'package:flutter/material.dart';
import 'package:new_proj/pages/screen1.dart';

/// Home Screen - Redirects to VIP Car Listings (Screen1)
/// This can be customized later for a dedicated home screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // For now, redirect to Screen1 (VIP cars)
    // This can be replaced with a proper home screen later
    return const Screen1();
  }
}

