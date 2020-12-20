import 'package:flutter/material.dart';
import 'package:weather_mobile/screens/home_screen.dart';
import '../constants.dart';

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
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.id, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kGradientBoxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Weather',
              style: kSplashTitleStyle,
            ),
            Text(
              'Created by Tjandra Darmo',
              style: kSplashNameStyle,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[900]),
            ),
          ],
        ),
      ),
    );
  }
}
