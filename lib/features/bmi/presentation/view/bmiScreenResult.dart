import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/Reusable_Bg.dart';
import '../components/BottomContainer_Button.dart';
import '../components/constants.dart';

class ResultPage extends StatelessWidget {
  final String resultText;
  final String bmi;
  final String advise;
  final Color textColor;

  Color blue = const Color(0xFF1e6bdd);
  Color blue2 = const Color(0xFF2B91F7);
  Color dark = const Color(0xFFFAB400);

  ResultPage(
      {required this.textColor,
        required this.resultText,
        required this.bmi,
        required this.advise});

  @override
  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0XFF1D6BDD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: screenHeight * 0.1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: screenWidth * 0.06,
          ),
        ),
        title: Text(
          "كتلة الجسم",
          style: TextStyle(
            fontFamily: "mess_bold",
            color: Colors.white,
            fontSize: screenWidth * 0.06,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'حسبنالك النتيجة',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'mess_bold',
                  fontSize: screenWidth * 0.09,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableBg(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'mess_bold'
                    ),
                  ),
                  Text(
                    bmi,
                    style: TextStyle(
                      fontFamily: 'mont_bold',
                      fontSize: screenWidth * 0.15,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'كتله الجسم الطبيعية',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'mess_bold',
                    ),
                  ),
                  Text(
                    '18.5 - 25 kg/m2',
                    style: TextStyle(
                      fontFamily: 'mont_bold',
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    advise,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'mess_bold',
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,

                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomContainer(
              text: 'إحسبلي مره كمان',
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
