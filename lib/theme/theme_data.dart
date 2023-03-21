import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../shared/design/ColorConstants.dart';


class ThemeConfig {
  static  Map<int, Color> _yellow700Map = {
    50: Color(0xFFfcfcfc),
    100: Colors.grey[100]!,
    200: Colors.grey[100]!,
    300: Colors.grey[100]!,
    400: Colors.grey[100]!,
    500: Colors.grey[100]!,
    600: Colors.grey[100]!,
    700: Colors.grey[100]!,
    800:Colors.grey[100]!,
    900: Colors.grey[100]!,
  };
  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    Color? secondaryText,
    required Color accentColor,
    Color? divider,
    Color? buttonBackground,
    required Color buttonText,
    Color? cardBackground,
    Color? disabled,
    required Color error,
  }) {
    final baseTextTheme = brightness == Brightness.dark
        ? Typography.blackMountainView
        : Typography.whiteMountainView;
    return ThemeData(
      primaryColor: ColorConstants.whiteColor1,
      focusColor: ColorConstants.blackColor2,
      hoverColor: ColorConstants.blackColor2,
      shadowColor: ColorConstants.greyColor2,
      fontFamily: 'Roboto',
      unselectedWidgetColor: ColorConstants.blackColor2,
      scaffoldBackgroundColor: ColorConstants.whiteColor1,
      backgroundColor: ColorConstants.primaryColor,
      errorColor: ColorConstants.redColor,
      splashColor: ColorConstants.blackColor2.withOpacity(0.20),
      canvasColor: ColorConstants.whiteColor1,
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: ColorConstants.whiteColor1,
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorConstants.whiteColor1,
          statusBarIconBrightness: Brightness.dark,
        ),
        actionsIconTheme: IconThemeData(
          color: ColorConstants.blackColor2,
        ),
        foregroundColor: ColorConstants.blackColor2,
        iconTheme: IconThemeData(
          color: ColorConstants.blackColor2,
        ),
        titleTextStyle: TextStyle(
            color: ColorConstants.blackColor2,
            fontSize: 20.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorConstants.blueColor,
          unselectedItemColor: ColorConstants.blackColor2,
          selectedLabelStyle: TextStyle(
              color: ColorConstants.blueColor,
              fontSize: 11,
              fontWeight: FontWeight.w500),
          unselectedLabelStyle:
          TextStyle(color: ColorConstants.blackColor2, fontSize: 11)),
      colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: ColorConstants.blackColor2),
    );
  }

  static ThemeData get lightTheme => createTheme(
    brightness: Brightness.light,
    background: ColorConstants.white,
    cardBackground: ColorConstants.secondaryAppColor,
    primaryText: Colors.black,
    secondaryText: ColorConstants.white,
    accentColor: ColorConstants.secondaryAppColor,
    divider: ColorConstants.secondaryAppColor,
    buttonBackground: Colors.black38,
    buttonText: ColorConstants.secondaryAppColor,
    disabled: ColorConstants.secondaryAppColor,
    error: Colors.red,

  );

  static ThemeData get darkTheme => createTheme(
    brightness: Brightness.dark,
    background: ColorConstants.white,
    cardBackground: ColorConstants.secondaryDarkAppColor,
    primaryText: Colors.white,
    secondaryText: Colors.black,
    accentColor: ColorConstants.secondaryDarkAppColor,
    divider: Colors.black45,
    buttonBackground: Colors.white,
    buttonText: ColorConstants.secondaryDarkAppColor,
    disabled: ColorConstants.secondaryDarkAppColor,
    error: Colors.red,
  );
}