import 'package:get/get.dart';

class GlobalState {
  late String accessToken;
  late String lang;

  GlobalState() {
    accessToken = '';
    lang = Get.deviceLocale?.languageCode ?? 'zh';
  }
}
