
import 'package:e7sebly/core/util/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  Color blue = const Color(0xFF1e6bdd); // colors variables
  Color blue2 = const Color(0xFF2B91F7);
  Color dark = const Color(0xFFFAB400);



  String equation = "0", result = "0"; // Expression and FinalResult
  Map<String, String> operatorsMap = {"÷": "/", "×": "*", "−": "-", "+": "+"};
  List buttonNames = [
    "7",
    "8",
    "9",
    "÷",
    "4",
    "5",
    "6",
    "×",
    "1",
    "2",
    "3",
    "−",
    "0",
    ".",
    "00",
    "+",
  ];

  void evaluateEquation() {
    try {
      // Fix equation
      Expression exp = (Parser()).parse(operatorsMap.entries.fold(
          equation, (prev, elem) => prev.replaceAll(elem.key, elem.value)));

      double res = double.parse(
          exp.evaluate(EvaluationType.REAL, ContextModel()).toString());

      // Output correction for decimal results
      result = double.parse(res.toString()) == int.parse(res.toStringAsFixed(0))
          ? res.toStringAsFixed(0)
          : res.toStringAsFixed(4);
    } catch (e) {
      result = "Error";
    }
  }

  void _buttonPressed(String text, {bool isClear = false}) {
    setState(() {
      if (isClear) {
        // Reset calculator
        equation = result = "0";
      } else if (text == "⌫") {
        // Backspace
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") equation = result = "0"; // If all empty
      } else {
        // Default
        if (equation == "0" && text != ".") equation = "";
        equation += text;
      }

      // Only evaluate if correct expression
      if (!operatorsMap.containsKey(equation.substring(equation.length - 1))) {
        evaluateEquation();
      }
    });
  }

  // Grid of buttons
  Widget _buildButtons() {
    return Material(
      color: Colors.transparent,
      child: GridView.count(
          crossAxisCount: 4, // 4x4 grid
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(15),
          children: buttonNames.map<Widget>((e) {
            switch (e) {
              case "+": // Addition Button
                return _button(e,0,true);
              case "×": // Multiplication Button
                return _button(e,0,true);
              case "−": // Subtraction Button
                return _button(e,0,true);
              case "÷": // Division Button
                return _button(e,0,true);
              default:
                return _button(e, 0,false);
            }
          }).toList()),
    );
  }

  // Normal button
  Widget _button(text, double paddingBot,bool isOperator) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(100)), // Circular
        color: blue2,
        child: CircleAvatar(
          backgroundColor: isOperator?dark:Colors.transparent,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return InkWell(
                  // Ripple Effect
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  onTap: () {
                    _buttonPressed(text);
                  },
                  child: Container(
                    // For ripple area
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    alignment: Alignment.center,
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 45.0,
                        fontFamily: "mont_bold",
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0XFF1D6BDD),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 90,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:  Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: (width <= 550) ? 25 : 20
              ,
            ),
          ),
          title:Text(
            "آلة حاسبة",
            style: TextStyle(
                fontFamily: "mess_bold",
                color: Colors.white,
                fontSize: (width <= 550) ? 25 : 20,

            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [

            SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 12.5, right: 12.5),
                      decoration: const BoxDecoration(
                        // Bottom Divider
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            // Expression
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: <Widget>[
                                Text(equation,
                                  style: TextStyle(
                                    fontSize: (width <= 550) ? 30 : 35,
                                    color: dark,
                                    fontFamily: "mont_bold",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // Clear Btn
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  borderRadius: BorderRadius.circular(100.0),
                                  onTap: () => {_buttonPressed("×", isClear: true)},
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 45,
                                    width: 45,
                                    child: Text(
                                      "×",
                                      style: TextStyle(
                                        fontFamily: "mont_medium",
                                          fontSize: (width <= 550) ? 36 : 45,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    // Result Area - Mid - Medium Size Ratio
                    flex: 2,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        child: Text(
                          result,
                          style: TextStyle(
                              color: const Color.fromRGBO(227, 227, 227, 1),
                              fontSize: (width <= 550) ? 85 : 100,
                              fontFamily: 'mont_bold'),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    // Controls Area - Bottom - Max Size Ration
                    flex: 5,
                    child: _buildButtons(),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}