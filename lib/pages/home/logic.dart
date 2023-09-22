import 'package:get/get.dart';
import 'package:mobile/global/logic.dart';
import 'package:mobile/routes.dart';

class HomeLogic extends GetxController {
  final global = Get.find<GlobalLogic>().state;

  @override
  void onReady() {
    if (global.accessToken == "") {
      Get.toNamed(HRoutes.login);
    }
    super.onReady();
  }
}
