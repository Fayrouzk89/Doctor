import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

import '../../routes/app_pages.dart';

import '../../shared/AppBars/MainAppBar.dart';
import '../../shared/AppFont.dart';
import '../../shared/LocalString.dart';
import '../../shared/Regex.dart';
import '../../shared/design/ColorConstants.dart';
import '../../shared/design/CommonConstants.dart';
import '../../shared/design/CommonWidget.dart';
import '../../shared/design/SizeConfig.dart';
import '../../shared/inputWidget/InputField.dart';
import '../../shared/inputWidget/InputFieldEmail.dart';
import '../../shared/inputWidget/InputPassword.dart';
import '../../shared/widget/CustomRounded.dart';
import 'auth_controller.dart';
import '../../globals.dart' as globals;
class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController controller = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          //resizeToAvoidBottomInset: false,
          appBar:MainAppBar(),
          backgroundColor: ColorConstants.white,
          body:Container(
    alignment: Alignment.topCenter,
    padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
    child: _buildForms(context),
    ),)
      ],
    );
  }

bool isClicked=false;

  Widget _buildForms(BuildContext context) {

    return Form(
      key: controller.registerFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              height: SizeConfig().screenHeight*0.3,
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Image.asset(
                  "images/signup.png",
                ),
              ),
            ),
            Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  LocalString.getStringValue(context, 'create_new_account') ??
                      "أنشئ حساب",
                  textAlign: TextAlign.center,
                  style: AppFont.bold.copyWith(
                      color: ColorConstants.black,
                      fontWeight: FontWeight.bold,
                      fontSize: CommonConstants.meduimText),
                )),
            CommonWidget.rowHeight(height: 10.0),
            InputFieldEmail(
              controller: controller.registerEmailController,
              keyboardType: TextInputType.text,
              //labelText: 'Email address',
              placeholder: LocalString.getStringValue(context, 'enter_email') ??
                  'ادخل البريد الالكتروني',
              validator: (value) {
                if (value!.isEmpty) {
                  return LocalString.getStringValue(
                      context, 'email_required') ??
                      'البريد الالكتروني حقل مطلوب';
                }
                if (value != null) {
                  if (!Regex.isEmail(value)) {
                    return LocalString.getStringValue(context, 'email_error') ??
                        'خطأ في صيغة البريد الالكتروني';
                  }
                }
                return null;
              },
              icon: Icons.mail,
            ),
            CommonWidget.rowHeight(height: 10),
            InputPassword(
              controller: controller.registerPasswordController,
              keyboardType: TextInputType.text,
              // labelText: 'Password',
              placeholder:
                  LocalString.getStringValue(context, 'enter_secret') ??
                      'ادخل الرمز السري',
              password: true,

              validator: (value) {
                if (value!.isEmpty) {
                  return LocalString.getStringValue(
                          context, 'password_required') ??
                      'الرمز السري حق مطلوب';
                }
                return null;
              },
              icon: Icons.lock,
            ),
            CommonWidget.rowHeight(height: 10.0),
            CheckboxListTile(
              title:  Text(
                LocalString.getStringValue(context, 'remember_me') ??
                    "تذكرني",
                style: AppFont.regular.copyWith(
                    color: ColorConstants.black,
                    fontWeight: FontWeight.bold,
                    fontSize: CommonConstants.meduimText),
              ),
              value: isClicked,
              onChanged: (newValue) {

                setState(() {
                  isClicked=!isClicked;
                });
              },
              contentPadding: EdgeInsets.only(left: 0, top: 0),
              controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            CommonWidget.rowHeight(height: 10.0),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                    horizontal: CommonConstants.horizontalPaddingButton,
                    vertical: CommonConstants.verticalPaddingButton),
                child: CustomRounded(
                  text:  LocalString.getStringValue(context, 'create_account') ??
                      "انشاء حساب",
                  textSize: CommonConstants.textButton,
                  textColor:Colors.white ,
                  color:ColorConstants.greenColor   ,
                  size: Size(SizeConfig().screenWidth * 0.8,
                      CommonConstants.roundedHeight),
                  pressed: () {
                  },
                )),
            CommonWidget.rowHeight(height: 10.0),
            Row(
                children: <Widget>[
                  Expanded(
                      child: Divider()
                  ),
                  SizedBox(width: 10.0),
                  Text(LocalString.getStringValue(context, 'or_continue') ?? "أو"),
                  SizedBox(width: 10.0),
                  Expanded(
                      child: Divider()
                  ),
                ]
            ),
            CommonWidget.rowHeight(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  customSignInButton(ButtonType.facebook,
                          () {
                        print("apple");
                      }),
                  customSignInButton(ButtonType.apple,
                          () {
                        print("apple");
                      }),
                  customSignInButton(ButtonType.google,
                          () {
                        print("apple");
                      }),

                ]
            ),
            CommonWidget.rowHeight(height: 10.0),
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
          ],
        ),
      ),
    );
  }
  customSignInButton(ButtonType type,GestureTapCallback  pressed)
  {
    return SignInButton.mini(
        padding: 2,

        buttonType: type,
        buttonSize: ButtonSize.small, // small(default), medium, large
        onPressed: () {
          pressed;
        });
  }
}
