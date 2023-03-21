import 'package:flutter/material.dart';

class ColorConstants {
  static const Color backgroundColor = Color(0xFFF1F2F8);
  static Color primaryColor = hexToColor('#004782');
  static const Color blueColor = Color(0xFF3199C9);

  //todo:black color
  static const Color blackColor1 = Color(0xFF000000);
  static const Color blackColor2 = Color(0xFF30292F);
  static const Color blackColor3 = Color(0xFF191919);
  static const Color darkBackgroundColor = Color(0xFF2C2C2C);

  static const Color redColor = Color(0xFFC10707);
  static const Color yellowColor = Colors.yellowAccent;

  //todo:grey color
  static const Color greyColor1 = Color(0xFFC9C9C9);
  static const Color greyColor2 = Color(0xff707070);
  static const Color greyColor3 = Color(0xff949494);
  static const Color greyColor4 = Color(0xff929096);
  static const Color greyColor5 = Color(0xFF8C8C8C);
  static const Color lightGreyColor = Color(0xFFCCCCCC);
  static const Color darkGreyColor = Color(0xFF6D6D6D);

  //todo:white Color
  static const Color whiteColor1 = Color(0xFFFFFFFF);
  static const Color whiteColor2 = Color(0xFFFEFEFE);
  static const Color whiteColor3 = Color(0xFFF8F0FB);
  static const Color whiteColor4 = Color(0xFFDCF0E8);

  static Color ktransparentPrimaryColor = Color(0xFF1381B2).withAlpha(95);
  static Color kPrimaryColor = Color(0xFF1381B2).withAlpha(95);
  static Color kPrimaryColorShadow =  Color(0xFF1381B2).withAlpha(95);

  static Color kPrimaryLightColor = Color(0xFFFFE6E6);
  static Color kTextColor = Color(0xFF3C4046);
  static Color kBackgroundColor = Color(0xFFF9F8FD);
  static Color greyBack = Color(0xFFf2f4f3);

  static double categoryWidth = 0.2;


  static double productWidth = 0.4;
  static double productHeight = 0.43;
  static double productHeightList = 0.43;
  static double sliderHeight = 200;

  static double productImgWidth = 0.4;


  static double kDefaultPadding = 20.0;
  static Color lightScaffoldBackgroundColor = hexToColor('#0b2f6d');
  static Color darkScaffoldBackgroundColor = hexToColor('#0b2f6d');
  static Color secondaryAppColor = white;//   hexToColor('#1381B2');
  static Color secondaryDarkAppColor =white;
  static Color tipColor = hexToColor('#B6B6B6');
  static Color lightGray = Color(0xFFF6F6F6);
  static Color darkGray = Color(0xFF9F9F9F);
  static Color black = Color(0xFF000000);
  static Color white = Color(0xFFFFFFFF);
  static Color whiteBack = Color(0xFFFFFFFF);
  static Color hintColor = Color(0xFF9F9F9F);
  static Color textColor = Color(0xFF000000);
  static Color filled=Color(0xFF2962FF);
  static Color notActiveColor= Color(0xFFE6E6DF);
  static Color blue=Color(0xFF2962FF);
  static Color yellow= Color(0xFFF57F17);
  static Color textColorBlue= Color(0xFF288CFF);

  static var colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static var colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );
  static Color greenColor = hexToColor('#1381B2');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );

}