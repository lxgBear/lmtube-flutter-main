import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/generated/locales.g.dart';
import 'package:mobile/pages/login/state.dart';
import 'package:mobile/widgets/button.dart';
import 'package:mobile/widgets/input.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final logic = Get.put(LoginLogic());
  final state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return _loginBg(children: [
      _loginTitle(theme),
      _loginForm(),
    ]);
  }

  Widget _loginForm() {
    return GetBuilder<LoginLogic>(
      builder: (logic) {
        switch (logic.state.loginType) {
          case LoginType.code:
            return _codeForm();
          case LoginType.username:
            return _usernameForm();
        }
      },
    );
  }

  Widget _codeForm() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 32),
        HInput(
          hint: LocaleKeys.input_phone.tr,
        ),
        const SizedBox(height: 80),
        HButton(
          LocaleKeys.buttons_next.tr,
          theme: HButtonThemes.primary,
        ),
        const SizedBox(height: 16),
        HButton(LocaleKeys.buttons_sign_by_pwd.tr,
            onTap: () => logic.switchLoginType(LoginType.username)),
      ],
    );
  }

  Widget _usernameForm() {
    return Form(
      key: state.formKey,
      child: Column(
        children: [
          HInput(
            hint: LocaleKeys.input_username.tr,
            onChanged: (v) => state.dto.account = v,
          ),
          const SizedBox(height: 16),
          GetBuilder<LoginLogic>(builder: (logic) {
            return HInput(
              hint: LocaleKeys.input_password.tr,
              obscureText: logic.state.isObscure,
              onObscureTap: logic.setObscure,
              onChanged: (v) => state.dto.secret = v,
            );
          }),
          const SizedBox(height: 24),
          HButton(
            LocaleKeys.buttons_login.tr,
            theme: HButtonThemes.primary,
            onTap: logic.handleUserLogin,
          ),
          const SizedBox(height: 16),
          HButton(LocaleKeys.buttons_sign_by_code.tr,
              onTap: () => logic.switchLoginType(LoginType.code)),
        ],
      ),
    );
  }

  Widget _loginBg({required List<Widget> children}) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: children),
      ),
    );
  }

  Widget _loginTitle(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        GetBuilder<LoginLogic>(
          builder: (logic) {
            return Text(
              logic.state.loginTitle.title,
              style: theme.textTheme.headlineSmall,
            );
          },
        ),
        const SizedBox(height: 4),
        GetBuilder<LoginLogic>(builder: (logic) {
          return Text(logic.state.loginTitle.desc,
              style: theme.textTheme.titleSmall);
        }),
      ],
    );
  }
}
