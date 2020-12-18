import 'package:flutter/material.dart';
import 'package:weather_mobile/screens/detail_screen.dart';
import 'package:weather_mobile/screens/home_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        DetailScreen.id: (context) => DetailScreen(),
      },
    );
  }
}
