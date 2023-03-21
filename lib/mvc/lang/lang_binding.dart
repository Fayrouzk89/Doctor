import 'package:get/get.dart';

import 'lang_controller.dart';

class LangBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LangController>(
            () => LangController());
  }
}
