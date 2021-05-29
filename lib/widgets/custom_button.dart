import 'package:crypto_station/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String buttonText;
  final VoidCallback buttonOnPress;
  final Color buttonBackground;
  final Color buttonTextColor;
  final double buttonTextSize;
  final FontWeight buttonTextFontWeight;

  CustomButton({
    required this.buttonText,
    required this.buttonOnPress,
    this.buttonTextColor = whiteColor,
    this.buttonBackground = mainColor,
    this.buttonTextSize = 18.0,
    this.buttonTextFontWeight = FontWeight.normal
  });


  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.all(15.0),
            primary: buttonTextColor,
            backgroundColor: buttonBackground,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            )
        ),
      child: Text(buttonText, style: TextStyle(fontSize: buttonTextSize,fontWeight: FontWeight.w500),),
      onPressed: buttonOnPress,
    );

  }
}
