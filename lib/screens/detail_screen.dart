import 'package:flutter/material.dart';
import 'package:weather_mobile/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bezier_chart/bezier_chart.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth / 15,
                  top: screenHeight / 8,
                  right: screenWidth / 15,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'icon',
                      child: SvgPicture.asset(
                        iconPath,
                        width: screenWidth / 10,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'December 20',
                          style: kDetailInfo,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Jakarta',
                          style: kDetailInfo,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                '28° C',
                style: kBigTempStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 16,
                ),
                child: weeklyChart(context),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 25,
                  left: 25,
                  right: 25,
                  top: 8,
                ),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white70.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Expanded(
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    '25 Km',
                                    style: kMainCardDetail,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SvgPicture.asset(
                                    'assets/svg/visibility.svg',
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
                                    '1007hPa',
                                    style: kMainCardDetail,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SvgPicture.asset(
                                    'assets/svg/speed.svg',
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget weeklyChart(BuildContext context) {
    final fromDate = DateTime(2020, 12, 15);
    final toDate = DateTime.now();

    final date1 = DateTime.now().subtract(Duration(days: 2));
    final date2 = DateTime.now().subtract(Duration(days: 3));

    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 32.0,
                bottom: 16.0,
              ),
              child: BezierChart(
                fromDate: fromDate,
                bezierChartScale: BezierChartScale.WEEKLY,
                toDate: toDate,
                selectedDate: toDate,
                series: [
                  BezierLine(
                    label: "C",
                    onMissingValue: (dateTime) {
                      if (dateTime.day.isEven) {
                        return 24.0;
                      }
                      return 28.0;
                    },
                    data: [
                      DataPoint<DateTime>(value: 26, xAxis: date1),
                      DataPoint<DateTime>(value: 27, xAxis: date2),
                    ],
                  ),
                ],
                config: BezierChartConfig(
                  bubbleIndicatorColor: Colors.white70.withOpacity(0.8),
                  verticalIndicatorStrokeWidth: 3.0,
                  verticalIndicatorColor: Colors.black26,
                  showVerticalIndicator: true,
                  verticalIndicatorFixedPosition: false,
                  footerHeight: 40.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  chartTypeSelector(true, 'Week'),
                  chartTypeSelector(false, 'Month'),
                  chartTypeSelector(false, 'Year'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chartTypeSelector(bool isSelected, String text) {
    return Container(
      height: MediaQuery.of(context).size.height / 20,
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white70 : null,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: isSelected ? Colors.black : Colors.white),
      )),
    );
  }
}
