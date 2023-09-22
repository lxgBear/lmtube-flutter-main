import 'package:get/get.dart';

import 'logic.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalLogic(), permanent: true);
  }
}
