import 'dart:io';

import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../routes/app_pages.dart';
import '../../globals.dart' as globals;
import '../../shared/AppFont.dart';
import '../../shared/LocalString.dart';
import '../../shared/StorageConstants.dart';
import '../../shared/design/ColorConstants.dart';
import '../../shared/design/CommonConstants.dart';
import '../../shared/design/SizeConfig.dart';
import 'SplashController.dart';
class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: ColorConstants.greenColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: GestureDetector(
                onTap:()
                {
                  GetToHome();
                },
                child:Container(
                  width: SizeConfig().screenWidth * 0.4,
                  child:Image.asset('images/logo.png'),),
              ),
            ),
            Text(
              LocalString.getStringValue(context, 'app_name') ?? "DOCTOR",
              //textAlign: TextAlign.center,
              style: AppFont.bold.copyWith(
                  color: ColorConstants.white,
                  fontWeight: FontWeight.bold,
                  fontSize: CommonConstants.largeText),
            ),
            //  _textLiquidFillAnimation()
          ],
        ),
      ),

    );
  }

  void GetToHome()async
  {
    SplashController. GetToHome();
  }

}

