// bottomnav.dart
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNav({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Color(0xFF0D3EDD), // Customize color
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'Buy',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.sell_outlined), label: 'sell'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_rounded), label: 'Chat'),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }
}
