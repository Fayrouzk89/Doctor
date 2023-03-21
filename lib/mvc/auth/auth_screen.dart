import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../../shared/AppBars/MainAppBar.dart';
import '../../shared/AppFont.dart';
import '../../shared/LocalString.dart';
import '../../shared/design/ColorConstants.dart';
import '../../shared/design/CommonConstants.dart';
import '../../shared/design/SizeConfig.dart';
import '../../shared/widget/CustomRounded.dart';
import 'package:sign_button/sign_button.dart';
import 'auth_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AuthScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: ColorConstants.whiteBack,
        appBar: MainAppBar(),
        body: _buildItems(context)
      ),
    );
  }

  Widget _buildItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        children: [
          Container(
            height: SizeConfig().screenHeight*0.3,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                "images/auth.jpg",
              ),
            ),
          ),
          Center(
            child: Text(
            LocalString.getStringValue(context, 'let_is') ?? "",
              //textAlign: TextAlign.center,
              style: AppFont.bold.copyWith(
                  color: ColorConstants.black,
                  fontWeight: FontWeight.bold,
                  fontSize: CommonConstants.meduimText),
            ),
          ),
          SizedBox(height: 10.0),
          customSignInButton(ButtonType.facebook,LocalString.getStringValue(context, 'face_book') ?? "فايس",
            () {
            print("facebook");
          }),
          SizedBox(height: 10.0),
          customSignInButton(ButtonType.google,LocalString.getStringValue(context, 'google') ?? "جوجل",
                  () {
                print("google");
              }),
          SizedBox(height: 10.0),
          customSignInButton(ButtonType.apple,LocalString.getStringValue(context, 'apple') ?? "أبل",
                  () {
                print("apple");
              }),
          SizedBox(height: 20.0),
          Row(
              children: <Widget>[
                Expanded(
                    child: Divider()
                ),
                SizedBox(width: 10.0),
                Text(LocalString.getStringValue(context, 'or') ?? "أو"),
                SizedBox(width: 10.0),
                Expanded(
                    child: Divider()
                ),
              ]
          ),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                  horizontal: CommonConstants.horizontalPaddingButton,
                  vertical: CommonConstants.verticalPaddingButton),
              child: CustomRounded(
                text: LocalString.getStringValue(context, 'sign_in') ??
                    "تسجيل الدخول",
                textSize: CommonConstants.textButton,
                textColor:Colors.white ,
                color:ColorConstants.greenColor   ,
                size: Size(SizeConfig().screenWidth * 0.8,
                    CommonConstants.roundedHeight),
                pressed: () {
                  Get.toNamed(Routes.AUTH + Routes.LOGIN,
                      arguments: controller);
                },
              )),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  //  Get.toNamed(Routes.HOME);
                },
                child: Text(
                  LocalString.getStringValue(context, 'have_account') ??
                      "هل لديك حساب",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: CommonConstants.normalText,
                      color: ColorConstants.textColor,
                      fontFamily: CommonConstants.largeTextFont,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 10,),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.AUTH + Routes.LOGIN,
                      arguments: controller);
                },
                child: Text(
                  LocalString.getStringValue(context, 'click_here') ??
                      "click_here",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: CommonConstants.normalText,
                      color: ColorConstants.greenColor,
                      fontFamily: CommonConstants.largeTextFont,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
  customSignInButton(ButtonType type,String text,GestureTapCallback  pressed)
  {
    return SignInButton(
        padding: 2,
        btnColor: Colors.white,
        btnTextColor: Colors.black,
        imagePosition: ImagePosition.right, // left or right
        buttonType: type,
        btnText: text,
        buttonSize: ButtonSize.small, // small(default), medium, large
        onPressed: () {
          pressed;
        });
  }
}
