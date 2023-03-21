import 'package:get/get.dart';

import 'shared/StorageService.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => StorageService().init());
  }
}