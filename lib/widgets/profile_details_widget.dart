import 'package:crypto_station/constants.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProfileDetailsWidget extends StatelessWidget {

  final String label;
  final String iconImage;
  final String data;

  ProfileDetailsWidget({
   required this.label,
   required this.data,
   required this.iconImage
});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Image.asset(iconImage, width: 20,),
            SizedBox(width: 3,),
            CustomText(
              text: "$label: ",
              textColor: grayColor,
              textSize: 15,
              textFontWeight: FontWeight.w500,
            ),
          ],
        ),
        Expanded(
            child: Text(
              data,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: nameColor,
                fontSize: 14,
              ),)
        ),
      ],
    );
  }
}
