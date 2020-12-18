import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sensors/sensors.dart';
import '../models/weather_svg.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AccelerometerEvent acceleration;
  StreamSubscription<AccelerometerEvent> _streamSubscription;
  Random random = Random();
  int mainIcon = 0;
  int iconMotionSensitivity = 4;

  @override
  void initState() {
    super.initState();
    pickIcon();
    _streamSubscription = accelerometerEvents.listen((event) {
      setState(() {
        acceleration = event;
      });
    });
  }

  void pickIcon() {
    // this function is supposed to match the real data if this app is using an API
    mainIcon = random.nextInt(weatherIconList.length - 1);
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF2193b0),
                Color(0xFF6dd5ed),
              ]),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 250),
              top: acceleration.y * iconMotionSensitivity,
              bottom: acceleration.y * -iconMotionSensitivity,
              right: acceleration.x * -iconMotionSensitivity,
              left: acceleration.x * iconMotionSensitivity,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight / 6),
                  child: Hero(
                    tag: 'icon',
                    child: SvgPicture.asset(
                      'assets/svg/${weatherIconList[mainIcon]}',
                      // color: Colors.grey[850],
                      width: screenWidth - 200,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
