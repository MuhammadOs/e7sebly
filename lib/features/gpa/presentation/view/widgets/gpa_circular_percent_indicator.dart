import 'package:e7sebly/core/util/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GpaCircularPercentIndicator extends StatelessWidget {
  final double gpa;

  const GpaCircularPercentIndicator({super.key, required this.gpa});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double w = SizeConfig.screenW!;
    return CircularPercentIndicator(
      radius: 100.0,
      lineWidth: 24.0,
      animation: true,
      percent: gpa / 4.0,
      center: Text(
        gpa.toStringAsFixed(2),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: "mess_medium",
          fontSize: w * 0.1,
          color: Colors.white,
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.orange,
      backgroundColor: Colors.blue,
    );
  }
}
