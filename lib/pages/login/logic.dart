import 'package:get/get.dart';
import 'package:mobile/global/logic.dart';
import 'package:mobile/http/net.dart';
import 'package:mobile/models/token_model.dart';

import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  final global = Get.find<GlobalLogic>().state;

  void switchLoginType(LoginType type) {
    state.loginType = type;
    update();
  }

  void setObscure() {
    state.isObscure = !state.isObscure;
    update();
  }

  Future<void> handleUserLogin() async {
    if (state.formKey.currentState?.validate() == true) {
      state.dto.source = state.loginType.source();
      try {
        var r = await fetch<TokenModel>("/v1/login",
            method: "POST", data: state.dto, silent: false);
        global.accessToken = r.accessToken!;
        Get.back();
      } catch (_) {}
    }
  }
}
