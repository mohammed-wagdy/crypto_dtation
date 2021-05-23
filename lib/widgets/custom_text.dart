import 'package:crypto_station/constants.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String text;
  final Color textColor;
  final double textSize;
  final FontWeight textFontWeight;
  final TextAlign textTextAlign;

  CustomText({
    this.text = "",
    this.textColor = blackColor,
    this.textFontWeight = FontWeight.normal,
    this.textSize = mainSize,
    this.textTextAlign = TextAlign.start
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textTextAlign,
      style: TextStyle(
        height: 1.6,
        color: textColor,
        fontWeight: textFontWeight,
        fontSize: textSize
      ),
    );
  }
}
