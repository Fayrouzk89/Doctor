import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';
import '../../shared/LocalString.dart';
import '../../shared/MessageHelper.dart';
import '../../shared/StorageService.dart';
import '../../shared/design/ColorConstants.dart';
import '../../shared/design/CommonConstants.dart';
import '../../shared/design/SizeConfig.dart';
import 'lang_controller.dart';
import '../../globals.dart' as globals;

class LangScreen extends GetView<LangController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: ColorConstants.whiteBack,
        body: _buildItems(context)

      ),
    );
  }

  Widget _buildItems(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(1.0),
      children: [
        Image.asset('images/language.png',
            width: double.infinity, height: 300, fit: BoxFit.contain),
        SizedBox(height: 10,),
        Text(
          LocalString.getStringValue(context, 'choose_lang') ??
              "اختر اللغة",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: CommonConstants.largeTextFont,
            fontSize: CommonConstants.largeText,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.headline6!.color,
          ),
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildWidgetFlag(context,1,"عربي",'images/arabic.png'),
            BuildWidgetFlag(context,2,"English",'images/english.png'),
          ],
        ),


      ],
    );
  }
  Widget BuildWidgetFlag(BuildContext context,int city,String city_name,String imageUrl)
  {
    return GestureDetector(
      onTap: ()
      {
        chooseLang(context,city);
      },
      child: Container(
      //  height: 80.0,
        width: SizeConfig().screenWidth/2.5,
        // color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20,top: 8,bottom: 8),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 6),
                      color: Colors.black38)
                ],
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(1),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: AssetImage(imageUrl),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
                Text(city_name,style: TextStyle(
                    color: Colors.black,
                    fontSize: CommonConstants.textButton,
                    fontWeight: FontWeight.bold,
                    fontFamily: CommonConstants.largeTextFont

                )),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  chooseLang(BuildContext buildContext,int lang)
  {
    if(lang==1)
    StorageService.saveLang("ar");
    else
      {
        StorageService.saveLang("en");
      }
    Locale _appLocale = Locale(globals.defaultLang);
    if(globals.lang=="ar") {
      _appLocale = Locale('ar');
    }
    else
    {
      _appLocale = Locale("en");
    }

    Get.updateLocale(_appLocale);

    if(globals.controller!=null ||MessageHelper.isLoggedIn())
      {
        globals.controller!.callMethods();
        Get.back();
      }
      else
        Get.offAllNamed(Routes.AUTH);

  }
}
