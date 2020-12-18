import 'package:flutter/material.dart';

TextStyle kSplashTitleStyle = TextStyle(
  fontFamily: 'PTSerif',
  fontSize: 48,
  fontWeight: FontWeight.bold,
);

TextStyle kSplashNameStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 14,
  fontStyle: FontStyle.italic,
);

BoxDecoration kGradientBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFF2193b0),
        Color(0xFF6dd5ed),
      ]),
);
