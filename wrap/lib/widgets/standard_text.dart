import 'package:flutter/material.dart';

class StandardText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? fontColor;
  StandardText({required this.text, this.fontSize, this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: fontColor ?? Colors.black,
        fontSize: fontSize,
      ),
    );
  }
}
