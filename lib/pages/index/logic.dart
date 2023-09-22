import 'dart:async';

import 'package:get/get.dart';
import 'package:mobile/routes.dart';

class IndexLogic extends GetxController {
  final period = const Duration(seconds: 1);
  late Timer timer;

  var count = 1.obs;

  void goHome() {
    timer.cancel();
    Get.offNamed(HRoutes.home);
  }

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(period, (timer) {
      count--;
      if (count <= 0) {
        goHome();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}
