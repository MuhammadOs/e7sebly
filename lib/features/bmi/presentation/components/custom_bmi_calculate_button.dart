import 'package:e7sebly/features/bmi/presentation/components/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:e7sebly/features/bmi/presentation/view/bmiScreenResult.dart';

class CustomBmiButton extends StatelessWidget {
  final int height;
  final int weight;

  const CustomBmiButton({super.key, required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;
    final double spacing = width * 0.04;
    final double spacingPadding = width * 0.3;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacingPadding, vertical: spacing),
      child: ElevatedButton(
        onPressed: () {
          // Calculate BMI and related values
          Calculate calc = Calculate(height: this.height, weight: this.weight);
          String bmi = calc.result();
          String resultText = calc.getText();
          String advise = calc.getAdvise();
          Color textColor = calc.getTextColor();

          // Navigate to the result page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BmiResultPage(
                textColor: textColor,
                resultText: resultText,
                bmi: bmi,
                advise: advise,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFAB400),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          textStyle: TextStyle(
            fontSize: width <= 550 ? 15 : 17,
          ),
        ),
        child: const Text(
          "يلا احسبلي",
          style: TextStyle(
            fontFamily: "mess_bold",
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
