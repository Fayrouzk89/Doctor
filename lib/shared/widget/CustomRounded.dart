import 'package:flutter/material.dart';

import '../design/CommonConstants.dart';


class CustomRounded extends StatelessWidget {
  const CustomRounded({
    Key? key,
    required this.text,
    required this.textSize,
    required this.size,
    required this.color,
    required this.textColor,
    required this.pressed, Color? borderColor,

  }) : super(key: key);

  final String text;
  final double textSize;
  final Size size;
  final Color color, textColor;
  final GestureTapCallback  pressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Align(
        alignment: Alignment.center,
        child:
        Text(text,
            style: TextStyle(
                color: textColor,
                fontSize: textSize,
                fontWeight: FontWeight.bold,
                fontFamily: CommonConstants.largeTextFont

            )

        )
        ,
      ),
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        padding: EdgeInsets.all(0),
        elevation: 10,
        fixedSize: size,
        primary: color,
        onPrimary: textColor,//Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)),
      ),
      onPressed: pressed,
    );
  }
}