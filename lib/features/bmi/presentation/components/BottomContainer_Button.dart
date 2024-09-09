import 'package:flutter/material.dart';
import 'constants.dart';

class BottomContainer extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final double height;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;

  const BottomContainer({
    Key? key,
    required this.text,
    required this.onTap,
    this.backgroundColor = const Color(0xFFFAB400),
    this.height = kbottomContainerHeight,
    this.padding = const EdgeInsets.only(bottom: 15.0),
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: height,
        padding: padding,
        child: Center(
          child: Text(
            text,
            style: textStyle ??
                const TextStyle(
                  fontFamily: 'mess_bold',
                  color: Colors.white,
                  fontSize: 25,
                ),
          ),
        ),
      ),
    );
  }
}
