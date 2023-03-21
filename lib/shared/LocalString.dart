import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../AppLocalizations.dart';
import '../../globals.dart' as globals;
import 'LocaleHelper.dart';
abstract class LocalString {
  static String? getStringValue(BuildContext context,String key)
  {
    return AppLocalizations.of(context)!.translate(key);
  }
  static Future<bool> LoadLang() async {

    var sharedPreferences = await SharedPreferences.getInstance();
    globals.lang = sharedPreferences.getString('lang')??'';
    String languageCode = Platform.localeName.split('_')[0];
    if(globals.lang==null || globals.lang=='')
    {
      globals.lang=languageCode;
    }

    helper.onLocaleChanged = onLocaleChange;
    AppLocalizationsDelegate specificLocalizationDelegate;
    specificLocalizationDelegate =  AppLocalizationsDelegate(new Locale(globals.lang));
    globals.specificLocalizationDelegate=specificLocalizationDelegate;
    return true;
  }


  static onLocaleChange(Locale locale){
    AppLocalizationsDelegate specificLocalizationDelegate;
    specificLocalizationDelegate = new AppLocalizationsDelegate(locale);
  }

}