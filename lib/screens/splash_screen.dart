import 'package:flutter/material.dart';
import 'package:weather_mobile/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, HomeScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
