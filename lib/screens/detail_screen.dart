import 'package:flutter/material.dart';
import 'package:weather_mobile/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatefulWidget {
  static String id = 'detail_screen';

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    String iconPath = ModalRoute.of(context).settings.arguments;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: kGradientBoxDecoration,
        child: Hero(
          tag: 'icon',
          child: SvgPicture.asset(
            iconPath,
            width: screenWidth - 200,
          ),
        ),
      ),
    );
  }
}
