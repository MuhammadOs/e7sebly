import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  RoundIconButton({required this.icon, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
          icon,
        color: Colors.white,
        size: 20,
      ),
      constraints: BoxConstraints.tightFor(
        width: 35.0,
        height: 35.0,
      ),
      elevation: 0.0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
      fillColor: const Color(0xFFFAB400),
    );
  }
}
