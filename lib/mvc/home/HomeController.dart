import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/Api.dart';
import '../../api/ApiRepo.dart';
import '../../globals.dart' as globals;
import '../../shared/StorageService.dart';


class HomeController extends GetxController {
  final registerFirstController = TextEditingController();
  final problemController = TextEditingController();

  int rate=0;
  @override
  void onInit() async {
    super.onInit();
    globals.controller=this;
    callMethods();

    //loadBanners();

  }
  void callMethods()async
  {
    Api.setLoading("Please wait");
    await StorageService.LoadUser();
  //  await getProducts();
    Api.hideLoading();
  }
  void callMyOrders()async
  {
    Api.setLoading("Please wait");
    Api.hideLoading();
  }
  @override
  void onReady() {
    super.onReady();
  }


  @override
  void onClose() {
    super.onClose();
  }

  exitApp()async
  {
    await StorageService.ResetInfo();
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}
