import 'package:crypto_station/constants.dart';
import 'package:crypto_station/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {

  final String titleName;
  final int count;
  final bool changeColor;

  SliderWidget({
    required this.titleName,
    required this.count,
    this.changeColor = false,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: CustomText(
                  text: titleName,
                  textColor: changeColor ? yellowColor : whiteColor,
                  textFontWeight: FontWeight.bold,
                  textSize: 20.0,
                ),
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(),
              CustomText(
                text: count.toString(),
                textSize: 50,
                textColor: yellowColor,
                textFontWeight: FontWeight.bold,
              ),
              GestureDetector(
                onTap: () {

                },
                child: Container(
                  decoration: BoxDecoration(
                      color: nameColor,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0),topRight: Radius.circular(20.0))
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: CustomText(
                    text: "عرض المزيد",
                    textColor: whiteColor,
                    textSize: 16,
                    textFontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          )
        ],
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/Panel.png",),
          )
      ),

    );
  }
}
