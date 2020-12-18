import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sensors/sensors.dart';
import 'package:weather_mobile/constants.dart';
import '../models/weather_svg.dart';
import 'detail_screen.dart';

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
        decoration: kGradientBoxDecoration,
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
                      width: screenWidth - 200,
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Jakarta',
                      textAlign: TextAlign.center,
                      style: kLocationStyle,
                    ),
                  ),
                  Container(
                    height: screenHeight / 3,
                    margin: EdgeInsets.only(bottom: 50, left: 25, right: 25),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white70.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Today',
                          style: kDayStyle,
                        ),
                        Text(
                          '28° C',
                          style: kTempStyle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          height: 1,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      '24.8 Km/h',
                                      style: kMainCardDetail,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SvgPicture.asset(
                                      'assets/svg/windy.svg',
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                              VerticalDivider(
                                width: 1,
                                color: Colors.black,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      '60%',
                                      style: kMainCardDetail,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SvgPicture.asset(
                                      'assets/svg/hum.svg',
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 1,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, DetailScreen.id);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'More details',
                                style: kMoreDetailsStyle,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.lightBlue[900],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
