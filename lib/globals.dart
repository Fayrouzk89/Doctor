library globals;


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'AppLocalizations.dart';
import 'model/UserInfo.dart';



var controller=null;
UserInfo? userInfo;
String InviteUrl="https://.com?id=";
int initialProductId=0;

String activateMsg="";
String generalTopic="general";
String fcm="";
String lang="ar";
String defaultLang="ar";
AppLocalizationsDelegate? specificLocalizationDelegate;
int my_account_operation=1;
int buy_operation=2;
int lang_operation=3;
int about_operation=4;
int term_operation=5;
int privacy_operation=6;
int exit_operation=7;
int close_app_operation=8;
int my_ads_operation=10;
int change_password_operation=15;
int delete_operation=16;



int publicProducts=-1;
int myProducts=-2;
int usersProducts=-3;
int similarProducts=-4;
int companyProducts=-5;
String companyName="";
int priceAdd=100;
int maxAds=20;
double silver_expanded_height=70;
double silver_tool_height=70;
double imagePaddingTop=5;
double imageHeightAppBar=50;
double imageWidthAppBar=130;

String mainUrl='';
int phonelength=10;

//HomeController? controller;
String? orginalPhone;
String? orginalPhonePrefix;


String getPrefixPhone(BuildContext context)
{
  return "";
}
String getLogoImage()
{
  return(lang!=null && lang=="ar")?'images/title.png':'images/title.png';
}
