import 'package:crypto_station/constants.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextFormField2 extends StatelessWidget {

  final String textLabel;
  final TextEditingController? textController;
  final TextInputType keyboardType;
  final bool isSecure;
  final double textLabelSize;
  final bool isTextArea;
  final bool isReadOnly;
  final bool isNormal;
  final bool isInitialValue;
  final String? initVal;

  CustomTextFormField2({
    required this.textLabel,
    this.textController,
    required this.keyboardType,
    this.textLabelSize = 16.0,
    this.isSecure = false,
    this.isTextArea = false,
    this.isNormal = false,
    this.isReadOnly = false,
    this.isInitialValue = false,
    this.initVal,
  });

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: textLabel,
            textColor: textLabelColor,
            textFontWeight: FontWeight.w500,
            textSize: textLabelSize,
          ),
          SizedBox(height: 10.0,),
          TextFormField(
            readOnly: isReadOnly ?  true : false,
            maxLines: isTextArea ? 4 : 1,
            controller: textController,
            keyboardType: keyboardType,
            obscureText: isSecure,
            cursorColor: mainColor,
            decoration: InputDecoration(
              filled: true,
              // fillColor: inputFillColor,
              contentPadding: EdgeInsets.all(15.0),
              border: OutlineInputBorder(borderSide: BorderSide(color: inputBorderColor,),borderRadius: BorderRadius.all(Radius.circular(10.0))),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: inputBorderColor),borderRadius: BorderRadius.all(Radius.circular(10.0))),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: mainColor.withOpacity(0.5)),borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
          )
        ],
      );
  }
}
