import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/models/login_dto.dart';

class LoginState {
  late LoginDTO dto;
  late bool isObscure;
  late LoginType loginType;
  late GlobalKey<FormState> formKey;

  get loginTitle => loginType.loginTitle();

  LoginState() {
    isObscure = true;
    dto = LoginDTO();
    loginType = LoginType.username;
    formKey = GlobalKey<FormState>();
  }
}

enum LoginType {
  username,
  code;

  LoginTitle loginTitle() {
    switch (this) {
      case LoginType.username:
        return LoginTitle(
          title: LocaleKeys.login_type_username.tr,
          desc: "",
        );
      case LoginType.code:
      default:
        return LoginTitle(
          title: LocaleKeys.login_type_code.tr,
          desc: LocaleKeys.login_type_code_desc.tr,
        );
    }
  }

  String source() {
    switch (this) {
      case LoginType.code:
        return "code";
      case LoginType.username:
        return "username";
      default:
        return "";
    }
  }
}

class LoginTitle {
  LoginTitle({
    required this.title,
    required this.desc,
  });

  String title;
  String desc;
}
