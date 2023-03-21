import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../api/response/LoginReponse.dart';
import '../../model/UserInfo.dart';
import '../../routes/app_pages.dart';
import '../../shared/AppBars/MainAppBar.dart';
import '../../shared/LocalString.dart';
import '../../shared/Regex.dart';
import '../../shared/design/ColorConstants.dart';
import '../../shared/design/CommonConstants.dart';
import '../../shared/design/CommonWidget.dart';
import '../../shared/design/SizeConfig.dart';
import '../../shared/inputWidget/InputFieldEmail.dart';
import '../../shared/inputWidget/InputFieldPhone.dart';
import '../../shared/inputWidget/InputPassword.dart';
import '../../shared/widget/CustomRounded.dart';
import 'auth_controller.dart';
import '../../globals.dart' as globals;

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController controller = Get.arguments;
  @override
  initState() {
    super.initState();
    controller!.loginFormKey=GlobalKey<FormState>();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: MainAppBar(),
          backgroundColor: ColorConstants.white,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: CommonConstants.paddingBottom),
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(
                      horizontal: CommonConstants.paddingHorizontal),
                  child: _buildForms(context),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onClick() {}

  Widget _buildForms(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
              height: SizeConfig().screenHeight*0.3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  "images/login.svg",
                ),
              ),
            ),
            CommonWidget.rowHeight(height: 10),
            Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  LocalString.getStringValue(context, 'sign_in') ??
                      "تسجيل الدخول",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: CommonConstants.normalText,
                      color: ColorConstants.textColor,
                      fontFamily: CommonConstants.largeTextFont),
                )),
            CommonWidget.rowHeight(height: 20),
            InputFieldEmail(
              controller: controller.loginStaffController,
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
              controller: controller.loginPasswordController,
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
            CommonWidget.rowHeight(height: 10),
            GestureDetector(
              onTap: () {

              },
              child: Text(
                LocalString.getStringValue(context, 'forget_password') ??
                    "هل نسيت كلمة المرور",
                // textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: CommonConstants.normalText,
                    color: ColorConstants.textColor,
                    fontFamily: CommonConstants.largeTextFont,
                    fontWeight: FontWeight.bold),
              ),
            ),
            CommonWidget.rowHeight(height: 10),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                    horizontal: CommonConstants.horizontalPaddingButton,
                    vertical: CommonConstants.verticalPaddingButton),
                child: CustomRounded(
                    text: LocalString.getStringValue(context, 'sign_in') ??
                        "تسجيل الدخول",
                    textSize: CommonConstants.textButton,
                    textColor: Colors.white,
                    color: ColorConstants.greenColor,
                    size: Size(SizeConfig().screenWidth * 0.8,
                        CommonConstants.roundedHeight),
                    pressed: () {
                      doLogin(context);
                    })),
            CommonWidget.rowHeight(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.HOME);
                  },
                  child: Text(
                    LocalString.getStringValue(context, 'dont_have_account') ??
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
                    Get.toNamed(Routes.AUTH + Routes.REGISTER,
                        arguments: controller);
                  },
                  child: Text(
                    LocalString.getStringValue(context, 'register_now') ??
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

  void doLogin(BuildContext context) async {


    UserInfo userInfo = UserInfo(
        id: 0,
        first_name: '',
        second_name: '',
        gender: '',
        email: controller.loginStaffController.text,
        password: controller.loginPasswordController.text,
        password_confirmation: '',
        type: '');
    globals.userInfo = userInfo;
    LoginResponse? res = await controller.login(context, userInfo);


  }
}
