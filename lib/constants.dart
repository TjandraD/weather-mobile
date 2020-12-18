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

TextStyle kDayStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 20,
);

TextStyle kMoreDetailsStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 18,
  color: Colors.lightBlue[900],
);

TextStyle kMainCardDetail = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 24,
);

TextStyle kLocationStyle = TextStyle(
  fontFamily: 'PTSerif',
  fontSize: 36,
  fontWeight: FontWeight.w600,
);

TextStyle kTempStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 48,
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
