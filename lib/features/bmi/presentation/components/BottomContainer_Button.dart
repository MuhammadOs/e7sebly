import 'package:flutter/material.dart';

import 'constants.dart';


class BottomContainer extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  BottomContainer({required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: const Color(0xFFFAB400),
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomContainerHeight,
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
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
