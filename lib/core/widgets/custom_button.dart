import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;
    final double spacing = width * 0.04;
    final double spacingPadding = width * 0.3;// 5% of screen width for spacing
    return Padding(
      padding: EdgeInsets.symmetric( horizontal: spacingPadding ,vertical: spacing),
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet<dynamic>(
            isScrollControlled: true,
            backgroundColor: const Color(0xFFFAB400),
            context: context,
            builder: (context) => Container(
              height: height * 0.4,
              decoration: const BoxDecoration(
                color: const Color(0xFFFAB400),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
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
