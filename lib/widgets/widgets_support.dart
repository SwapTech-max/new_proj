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
  static TextStyle headingTextFeildStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: 'Oswald',
    );
  }
}

// Text style helper functions for HomeScreen
TextStyle oswald({double? size, FontWeight? weight, Color? color}) {
  return TextStyle(
    fontSize: size ?? 16,
    fontWeight: weight ?? FontWeight.normal,
    color: color ?? Colors.black,
    fontFamily: 'Oswald',
  );
}

TextStyle poppins({double? size, FontWeight? weight, Color? color}) {
  return TextStyle(
    fontSize: size ?? 16,
    fontWeight: weight ?? FontWeight.normal,
    color: color ?? Colors.black,
    fontFamily: 'Poppins',
  );
}

TextStyle inter({double? size, FontWeight? weight, Color? color}) {
  return TextStyle(
    fontSize: size ?? 16,
    fontWeight: weight ?? FontWeight.normal,
    color: color ?? Colors.black,
    fontFamily: 'Inter',
  );
}