import 'package:get/get.dart';

import 'HomeController.dart';


class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
            () => HomeController());
  }
}
