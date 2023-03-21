import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../PublicController.dart';
import '../../api/Api.dart';
import '../../api/ApiRepo.dart';
import '../../api/LogUtil.dart';
import '../../api/response/LoginReponse.dart';
import '../../model/UserInfo.dart';
import '../../routes/app_pages.dart';
import '../../globals.dart' as globals;
import '../../shared/AppFocus.dart';
import '../../shared/LocalString.dart';
import '../../shared/MessageHelper.dart';
import '../../shared/StorageService.dart';
import '../../globals.dart' as globals;
class AuthController extends GetxController {

  AuthController();

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final registerFirstController = TextEditingController();
  final registerLastController = TextEditingController();
  final registerPhoneController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  String gender="male";
  String individual="";
  bool registerTermsChecked = false;
  String city="";

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginStaffController = TextEditingController();
  final loginPasswordController = TextEditingController();

  GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();
  final forgetPhoneController = TextEditingController();

  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  TextEditingController newTextEditingController = TextEditingController();


  final GlobalKey<FormState> activateFormKey = GlobalKey<FormState>();
  String codeActivation="";
  String codeDeletion="";
  FocusNode focusNode = FocusNode();
  String code="";


  final GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();
  TextEditingController newPasswordEditingController = TextEditingController();
  TextEditingController newPasswordConfirmPasswordController = TextEditingController();
  GlobalKey<FormState> deleteFormKey = GlobalKey<FormState>();
  final deletePhoneController = TextEditingController();
  final deletePasswordController = TextEditingController();
  GlobalKey<FormState> deleteResetFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    print('init auth');
    callInit();
  }
  callInit()async
  {
  // await getCountriesResponse();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void register(BuildContext context) async {
    AppFocus.unfocus(context);
    if (registerFormKey.currentState!.validate()) {
      // Get.toNamed(Routes.HOME);
      UserInfo userInfo = UserInfo( id: 0,
          first_name: registerFirstController.text,
          second_name: registerLastController.text,
          gender: gender,
          password: registerPasswordController.text,
          password_confirmation: registerConfirmPasswordController.text,
          type:individual, email: registerEmailController.text
      );
      globals.userInfo=userInfo;
      RegisterUser(context,userInfo);
    }
  }
  Future<LoginResponse?> RegisterUser(BuildContext context,UserInfo userInfo) async {
    Api.setLoading(LocalString.getStringValue(context, 'pleaseWait') ??
        'يرجى الانتظار');
    try {
      final result = await ApiRepo().registerUser(userInfo);
      Api.hideLoading();
      if (result != null) {
        if (result!=null) {
          processRegisterResult(result, context);
          return result;
        } else {
          processRegisterResult(result, context);
        }
      }
      else
      {
        return null;
      }
    } catch (e) {
      Log.loga(title, "RegisterUser:: e >>>>> $e");
      Api.hideLoading();
      processRegisterResult(null, context);
      return null;
    }
  }
  void processRegisterResult(LoginResponse? response,BuildContext context)
  {
    if(response!=null)
    {
      if(response.success==true)
      {
        if(response.data!=null && response.data!=null) {
          MessageHelper.showMessage(context,response.message!);
          StorageService.saveUserInfo(response.data!);
          // Get.clearRouteTree();
          // Get.offNamedUntil(Routes.HOME', (route) => false);;
          PublicController.openHome(context);
        }
        else
        {
          processFailRegister(response,context);
        }
      }
      else
      {
        processFailRegister(response,context);
      }
    }
    else
    {
      MessageHelper.showMessage(context,LocalString.getStringValue(
          context, 'time_out') ??
          'تايم اوت');
    }
  }
  void processFailRegister(LoginResponse response,BuildContext context)
  {
    if(response.message!=null)
    {
      MessageHelper.showMessage(context,response.message!);
    }
    else
    {
      MessageHelper.showMessage(context,LocalString.getStringValue(
          context, 'error_register') ??
          'خطأ في التسجيل يرجى التحقق من المعلومات');
    }
  }
  Future<LoginResponse?> login(BuildContext context,UserInfo userInfo) async {
    AppFocus.unfocus(context);
    if (loginFormKey.currentState!.validate()) {
      Data user =Data( token: "ddd",name: userInfo.email.substring(0,4));
      StorageService.saveUserInfo(user);
      PublicController.openHome(context);
    }
  }
  void processResult(LoginResponse? response,BuildContext context)
  {
    if(response!=null)
    {
      if(response.success==true)
      {
        if(response.data!=null && response.data!.name!=null) {
          StorageService.saveUserInfo(response.data!);
          PublicController.openHome(context);
        }
        else
        {
          processFailLogin(response,context);
        }
      }
      else
      {
        processFailLogin(response,context);
      }
    }
    else
    {
      MessageHelper.showMessage(context,LocalString.getStringValue(
          context, 'time_out') ??
          'تايم اوت');
    }
  }
  void processFailLogin(LoginResponse response,BuildContext context)
  {
    if(response.message!=null)
    {
      MessageHelper.showMessage(context,response.message!);
    }
    else
    {
      MessageHelper.showMessage(context,LocalString.getStringValue(
          context, 'error_login') ??
          'خطأ في تسجيل الدخول يرجى التحقق من المعلومات');
    }
  }
}
