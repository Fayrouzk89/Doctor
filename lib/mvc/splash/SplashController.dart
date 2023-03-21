import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';

import '../../PublicController.dart';
import '../../routes/app_pages.dart';
import '../../shared/LocalString.dart';
import '../../shared/StorageConstants.dart';
import '../../globals.dart' as globals;
class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(Duration(milliseconds: 3000));
    await  GetToHome();

  }
 static GetToHome()async
  {
    var storage = Get.find<SharedPreferences>();
    try {
      await LocalString.LoadLang();
      if (storage.getString(StorageConstants.accessToken) != null && storage.getString(StorageConstants.accessToken) != '' ) {
        PublicController.openHome(Get.context!);
      } else {
        Get.toNamed(Routes.AUTH);
      }
    } catch (e) {
      Get.toNamed(Routes.AUTH);
    }
  }



}