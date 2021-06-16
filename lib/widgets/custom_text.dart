import 'package:crypto_station/constants.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String text;
  final Color textColor;
  final double textSize;
  final FontWeight textFontWeight;
  final TextAlign textTextAlign;
  final bool userName;

  CustomText({
    this.text = "",
    this.textColor = blackColor,
    this.textFontWeight = FontWeight.normal,
    this.textSize = mainSize,
    this.textTextAlign = TextAlign.start,
    this.userName = false,
  });

  @override
  Widget build(BuildContext context) {
    return !userName ? Text(
      text,
      textAlign: textTextAlign,
      style: TextStyle(
          height: 1.4,
          color: textColor,
          fontWeight: textFontWeight,
          fontSize: textSize
      ),
    ) : Text(
      text,
      textAlign: textTextAlign,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          height: 1.4,
          color: textColor,
          fontWeight: textFontWeight,
          fontSize: textSize
      ),
    );
  }
}