import 'package:e7sebly/core/util/sizeConfig.dart';
import 'package:e7sebly/features/bmi/presentation/Components/Reusable_Bg.dart';
import 'package:e7sebly/features/bmi/presentation/components/RoundIcon_Button.dart';
import 'package:e7sebly/features/bmi/presentation/components/constants.dart';
import 'package:e7sebly/features/bmi/presentation/components/custom_bmi_calculate_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

enum Gender {
  male,
  female,
}

class _BmiScreenState extends State<BmiScreen> {
  late Gender selectedGender = Gender.male;
  int height = 150;
  int weight = 60;
  int age = 25;
  Color blue = const Color(0xFF1e6bdd);
  Color blue2 = const Color(0xFF2B91F7);
  Color dark = const Color(0xFFFAB400);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double screenWidth = SizeConfig.screenW!;
    double screenHeight = SizeConfig.screenH!;
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableBg(
                      colour: selectedGender == Gender.male
                          ? const Color(0xFFFAB400)
                          : const Color(0xFF2B91F7),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/img/icons/man.png',
                            height: screenHeight * 0.1,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'ذكر',
                            style: TextStyle(
                                fontSize: screenWidth * 0.06,
                                color: Colors.white,
                                fontFamily: 'mess_regular'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableBg(
                      colour: selectedGender == Gender.female
                          ? const Color(0xFFFAB400)
                          : const Color(0xFF2B91F7),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/img/icons/woman.png',
                            height: screenHeight * 0.1,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'أنثى',
                            style: TextStyle(
                                fontSize: screenWidth * 0.06,
                                color: Colors.white,
                                fontFamily: 'mess_regular'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: ReusableBg(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'الطول',
                    style: klabelTextStyle.copyWith(
                        fontSize: screenWidth * 0.06,
                        fontFamily: 'mess_regular'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kDigitTextStyle.copyWith(
                            fontSize: screenWidth * 0.1,
                            fontFamily: 'mont_bold',
                            color: Colors.white),
                      ),
                      Text(
                        'cm',
                        style: klabelTextStyle.copyWith(
                          fontSize: screenWidth * 0.04,
                          fontFamily: 'mont_bold',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: dark,
                        inactiveTrackColor: ksliderInactiveColor,
                        thumbColor: dark,
                        overlayColor: Color(0x29FAB400),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 15.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: ReusableBg(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'الوزن',
                          style: klabelTextStyle.copyWith(
                              fontSize: screenWidth * 0.06,
                              fontFamily: 'mess_regular'),
                        ),
                        Text(
                          weight.toString(),
                          style: kDigitTextStyle.copyWith(
                            fontSize: screenWidth * 0.1,
                            fontFamily: 'mont_bold',
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: screenWidth * 0.04,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableBg(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'السن',
                          style: klabelTextStyle.copyWith(
                              fontSize: screenWidth * 0.06,
                              fontFamily: 'mess_regular'),
                        ),
                        Text(
                          age.toString(),
                          style: kDigitTextStyle.copyWith(
                            fontSize: screenWidth * 0.1,
                            fontFamily: 'mont_bold',
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: screenWidth * 0.04),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomBmiButton(
            height: height,
            weight: weight,
          ),
        ],
      ),
    );
  }
}
