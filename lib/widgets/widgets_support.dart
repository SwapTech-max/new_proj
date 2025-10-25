import 'package:flutter/material.dart';

class Appwidget {
  static TextStyle boldTextFeildStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w900,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle semiboldTextFeildStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    );
  }

  static TextStyle headlineTextFeildStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 28,
      fontWeight: FontWeight.bold,
      fontFamily: 'Oswald',
    );
  }
}
