import 'package:get/get.dart';

import 'SplashController.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}